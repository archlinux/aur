# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=astylewx
pkgver=3.1
pkgrel=1
pkgdesc="A Graphical User Interface for Artistic Style Using wxWidgets"
arch=('x86_64')
url="http://astyle.sourceforge.net/astylewx/"
license=('MIT')
depends=('wxgtk2' 'astyle')
source=("https://downloads.sourceforge.net/project/$pkgname.astyle.p/$pkgname/$pkgname $pkgver/${pkgname}_${pkgver}_linux.tar.gz"
        'astylewx-destdir.patch')
md5sums=('06a72203f953440ff254eb69940b4517'
         'cb9226bb562f88b09f57f3fd708fff3b')

prepare() {
    cd "${pkgname}_${pkgver}_linux/$pkgname/build/gcc"
    patch -p3 -i "$srcdir"/astylewx-destdir.patch
}

build() {
    cd "${pkgname}_${pkgver}_linux/$pkgname/build/gcc"
    make deps
    make
}

package() {
    cd "${pkgname}_${pkgver}_linux/$pkgname/build/gcc"
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -Dm644 ../../LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.md
    install -Dm644 ../../README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
}
