pkgname=mupen64plus-qt
pkgver=1.14
pkgrel=2
pkgdesc="A customizable launcher for Mupen64Plus"
arch=('i686' 'x86_64')
url="https://github.com/dh4/mupen64plus-qt"
license=('BSD')
depends=('quazip' 'mupen64plus' 'hicolor-icon-theme')
install=mupen64plus-qt.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dh4/${pkgname}/archive/${pkgver}.tar.gz"
        "quazip-fix.patch")
sha256sums=('467f4e5b75a0f63f23b1c8266746b3e7932b9dc4ee950c42b2bfaf9660e64614'
            'c4db13e2620d5d16f5c58b5884f1275c225bc8f90720f980cdc2fb1f2d7677f6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    patch --forward --strip=1 --input="$srcdir/quazip-fix.patch"

    qmake-qt5
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "mupen64plus-qt"                     "$pkgdir/usr/bin/mupen64plus-qt"
    install -Dm644 "LICENSE"                            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resources/mupen64plus-qt.desktop"   "$pkgdir/usr/share/applications/mupen64plus-qt.desktop"
    install -Dm644 "resources/images/mupen64plus.png"   "$pkgdir/usr/share/icons/hicolor/128x128/apps/mupen64plus-qt.png"
}
