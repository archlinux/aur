# Maintainer: John Regan <john@jrjrtech.com>

pkgname=bdf2sfd
pkgver=1.2.0
pkgrel=1
pkgdesc='BDF to SFD converter, allowing to vectorize bitmap fonts'
url='https://github.com/fcambus/bdf2sfd'
arch=('i686' 'x86_64' 'aarch64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('cmake')
source=("$url/releases/download/${pkgver}/bdf2sfd-${pkgver}.tar.gz")
sha256sums=('43ffe2034d1e064a4583c67bd228668742d3dec59d34d7270c5ffffb7ccc7196')


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

