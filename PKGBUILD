# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=chunky_png
pkgname=ruby-${_gemname}
pkgver=1.3.8
pkgrel=1
pkgdesc='Read/write access to PNG images in pure Ruby'
arch=('any')
url='http://wiki.github.com/wvanbergen/chunky_png'
license=("MIT")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('3e4725c960e8f404f9702323deec6d77a3ef8bcaba9b679483c7de2be1ea327a2a8a7f67cb6beaa1a3c473e573600cc7b228aceceaa37f0a522cf9b2892e0351')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
