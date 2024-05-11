# Maintainer: John Regan <john@jrjrtech.com>

pkgname=bdf2sfd
pkgver=1.1.8
pkgrel=1
pkgdesc='BDF to SFD converter, allowing to vectorize bitmap fonts'
url='https://github.com/fcambus/bdf2sfd'
arch=('i686' 'x86_64')
license=('BSD-2-Clause')
makedepends=('cmake')
source=("https://github.com/fcambus/bdf2sfd/releases/download/${pkgver}/bdf2sfd-${pkgver}.tar.gz")
sha256sums=('f654cc5de15f7a290bcb6a1d945973f534e99aa19712a4476386e4271a790191')


build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

