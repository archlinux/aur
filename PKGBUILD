# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=mixlib-config
pkgname=ruby-${_gemname}
pkgver=3.0.6
pkgrel=1
pkgdesc="A class based configuration library"
arch=("any")
url="https://rubygems.org/gems/${_gemname}"
license=("Apache")
makedepends=("ruby-rdoc")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('5306c0cfe5a67de0a82f0a8897ebf6332b00b26cd367d016c4063d4e5e4b8b92')
noextract=($_gemname-$pkgver.gem)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
