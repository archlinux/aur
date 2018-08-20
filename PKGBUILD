# Maintainer: Zack Emmert <zemmert@fastmail.com>
pkgname=krita-plugin-gmic-git
pkgver=2.3.3.r16.ge1f2980
pkgrel=1
pkgdesc="Krita plugin for the G'MIC image processing framework"
arch=("x86_64")
url="http://gmic.eu/"
license=('GPL3')
depends=('krita' 'gmic')
makedepends=('git')
conflicts=('krita-plugin-gmic')
provides=('krita-plugin-gmic')
source=("git+https://github.com/c-koi/gmic-qt.git" "git+https://github.com/dtschump/gmic.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "gmic-qt"
	  git describe --long | sed 's/^v.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C gmic/src CImg.h gmic_stdlib.h
	cd "gmic-qt"
	qmake HOST=krita
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm775 "gmic-qt/gmic_krita_qt" "$pkgdir/usr/bin/"
}
