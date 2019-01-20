# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=chunky_png
pkgname=ruby-${_gemname}
pkgver=1.3.11
pkgrel=1
pkgdesc='Read/write access to PNG images in pure Ruby'
arch=('any')
url='http://wiki.github.com/wvanbergen/chunky_png'
license=('MIT')
makedepends=('rubygems' 'ruby-rdoc')
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('5935bc7672ef4eb271abe0e2d4b83c2628ecb9d4fc1bb095d28d0f7fd5e13443492bc91b2c9c1de59d8bb669c185cddaeef62d03d3b0df88ecfaaa3c7a2a0ba6')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-$pkgver.gem -n "${pkgdir}/usr/bin" || return 1
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
