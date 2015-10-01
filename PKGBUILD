# Contributor: Madalin Ignisca <madalin.ignisca@gmail.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=bootstrap-sass
pkgname=ruby-${_gemname}
pkgver=3.3.5.1
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
sha512sums=('32e4e77cd1d74ab748e29f22d74cc0261a0fc11db21f31b39de8a7f3cdec8bcb4fede105d8dc7f24b02273452e30bef87af40f7fac60b5b9bda13377326ff791')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
