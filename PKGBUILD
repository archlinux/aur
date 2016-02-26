# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode
pkgname=ruby-${_gemname}
pkgver=0.10.1
pkgrel=1
pkgdesc='library for encoding QR Codes'
arch=('any')
url='https://github.com/whomwah/rqrcode'
license=("MIT")
depends=('ruby-chunky_png>=1.0')
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('5b2d6e63bc069a1cf436d2df159bef673ef621a73d72c52bbdec1c2d820f4553172d5c3499b9347e0939d422bffa8f39ecaae123ce0be360d25ab6c08a6eb583')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
