# Maintainer: Zack Emmert <zack.emmert@gmail.com>
pkgname=krita-plugin-gmic-git
pkgver=2.0.3
pkgrel=1
epoch=
pkgdesc="Krita plugin for the G'MIC image processing framework"
arch=("x86_64")
url="http://gmic.eu/"
license=('GPL3')
depends=('krita')
makedepends=('qt5-base')
install="$pkgname.install"
source=("git+https://github.com/c-koi/gmic-qt.git" "git+https://github.com/dtschump/gmic.git")
sha256sums=('SKIP' 'SKIP')

build() {
    make -C gmic/src CImg.h gmic_stdlib.h
	cd "gmic-qt"
	qmake HOST=krita
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib/kritaplugins"
	mv "gmic-qt/gmic_krita_qt" "$pkgdir/usr/lib/kritaplugins/"
}
