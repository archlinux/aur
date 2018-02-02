# Maintainer: Jack Wu <origincoder@yahoo.com>
_pkgname=bilibili-live-helper
pkgname=bilibili-live-helper-git
pkgver=r8.00d234b
pkgrel=1
pkgdesc="A Helper for Bilibili Live."
arch=('x86_64')
url="https://github.com/pandaGao/bilibili-live-helper"
install=${pkgname}.install
license=('MIT')
depends=('cairo' 'libxtst' 'libxi' 'gtk2' 'libxrandr' 'pango' 'fontconfig' 'libxss' 'gdk-pixbuf2' 'nss' 'freetype2' 'nspr' 'gconf' 'libxext' 'libxdamage' 'atk' 'libxrender' 'libxcomposite' 'libxcursor' 'libxfixes' 'libx11' 'alsa-lib' 'libcups')
makedepends=('tar' 'electron')
provides=('bilibili-live-helper')
conflicts=('bilibili-live-helper')
source=('git+https://github.com/pandaGao/bilibili-live-helper')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	npm run-script build
	cd builds
	mv Bilibili直播弹幕库-linux-x64 ${_pkgname}
	cd ${_pkgname}
	mv Bilibili直播弹幕库 ${_pkgname}
}

package() {
	cp -r ${srcdir}/${_pkgname}/builds/${_pkgname}/ .
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -r ./${_pkgname}/* "${pkgdir}/opt/${_pkgname}"
}
