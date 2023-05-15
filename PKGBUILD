# Maintainer: Stein Gunnar Bakkeby <bakkeby@gmail.com>
pkgname="encircle"
pkgver="1.1"
pkgrel=1
pkgdesc="A Xinerama X cursor monitor wrapper"
url="https://github.com/bakkeby/encircle"
arch=("any")
license=('MIT')
depends=('libxinerama' 'libxi')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bakkeby/encircle/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b6e239e72da8618df0ad6848da47c3c923ed365dc9fe4a9a5cce26ad490ef4f0')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    #make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm755 encircle "$pkgdir/usr/bin/encircle"
    install -Dm644 encircle.1 "$pkgdir/usr/share/man/man1/encircle.1"
    sed -i "s/VERSION/1.0/g" "$pkgdir/usr/share/man/man1/encircle.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
