# Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=qtspell
pkgver=0.8.4
pkgrel=2
pkgdesc="Spell checking for Qt text widgets"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/qtspell"
license=('GPL3')
depends=('enchant' 'iso-codes' 'qt5-tools')
makedepends=('cmake' 'doxygen')
source=("git+https://github.com/manisandro/$pkgname.git#tag=$pkgver"
        "fix-deprecated-macro.patch")
sha256sums=('SKIP'
            '5c5aed476d1d6a5a2877863a9ff6689bbe1e8c3aefcd06dff9badde6bdb5a4b1')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "$srcdir/fix-deprecated-macro.patch"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake -DUSE_QT5=true -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir"/ install
}

