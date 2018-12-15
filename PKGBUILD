# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=mixlib-config
pkgname=ruby-${_gemname}
pkgver=2.2.4
pkgrel=2
pkgdesc="A class based configuration library"
arch=("any")
url="https://rubygems.org/gems/${_gemname}"
license=("Apache")
makedepends=("ruby-rdoc")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('5c90f95d03687f78ec80dd895f656173dd2a5e60c5c195917d21a7f2a5794a68')
noextract=($_gemname-$pkgver.gem)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
