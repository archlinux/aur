# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xorg-rendercheck
pkgver=1.6
pkgrel=1
pkgdesc="Suite of tests for the render extension"
url="http://xorg.freedesktop.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libxrender')
makedepends=('xorgproto' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/xorg/test/rendercheck/-/archive/rendercheck-${pkgver}/rendercheck-rendercheck-${pkgver}.tar.gz"
        dst_color.diff)

build() {
	cd "${srcdir}/rendercheck-rendercheck-${pkgver}"
	patch -Np1 -i ../dst_color.diff
	arch-meson . build
	meson compile -C build
}

package() {
	cd "${srcdir}/rendercheck-rendercheck-${pkgver}"
	meson install -C build --destdir "${pkgdir}"
}

sha256sums=('1b9156a9846521a9848df5ebb3b50a320c81bd6504b1fcaecc24ef854176b5f9'
            '096f2e14ce37ac62f221779335f6867bf7ecd4ce4132c4e8a018e762a9cbc7cb')
