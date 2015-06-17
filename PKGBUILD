# Contributor: Madalin Ignisca <madalin.ignisca@gmail.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=bootstrap-sass
pkgname=ruby-${_gemname}
pkgver=3.3.4.1
pkgrel=1
pkgdesc='Official Sass port of Bootstrap'
arch=('any')
url='http://getbootstrap.com/css/#sass'
license=("MIT")
depends=('ruby-sass')
makedepends=("rubygems")
optdepends=("ruby-compass")
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('185c4a307581f96ab4236d2c4c56a8ffdb3e0bb6cd85d59822d3f48d3cc02b403ce8ca3db09da01d4f5e63bfb28b5883d98e1580ca3871ecb382b71dc090c486')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
