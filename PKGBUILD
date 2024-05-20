# Maintainer: Liu Xiangzhi <liuxiangzhi000@gmail.com>
pkgname=cami
pkgver=0.2.1
pkgrel=2
epoch=
pkgdesc="C Abstract Machine Interpreter. A detector of undefined behavior and other common defects"
arch=('x86_64')
url="https://github.com/Liu-Xiangzhi/CAMI"
license=('GPL-2.0-or-later')
groups=()
depends=('glibc' 'gcc-libs')
makedepends=('cmake>=3.20' 'python>=3.11')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://github.com/Liu-Xiangzhi/CAMI/archive/refs/tags/0.2.1.tar.gz')
noextract=()
sha256sums=('bee5e27fa56791e7fe050a4c3006a87dfb4bc552ce5538592931aba198cc760c')
validpgpkeys=()

build() {
	cd "CAMI-$pkgver"
	cmake -S . -B build -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
	cmake --build build -j $(nproc)
}

package() {
	mkdir -p $pkgdir/usr/share/doc/cami
	mkdir -p $pkgdir/usr/share/man/man1/
	python $startdir/patch_doc.py "$srcdir/CAMI-$pkgver"
	cd "CAMI-$pkgver"
	gzip -c doc/cami.1 > $pkgdir/usr/share/man/man1/cami.1.gz
	cp -r doc/* $pkgdir/usr/share/doc/cami/
	rm $pkgdir/usr/share/doc/cami/cami.1
	cmake --build build --target install
}
