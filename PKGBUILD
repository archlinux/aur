# Maintainer: p.devil <p dot devil at gmail dot com>
pkgbase="fujprog"
pkgname="$pkgbase"
pkgver="4.8"
pkgrel="1"

pkgdesc="ULX2S / ULX3S JTAG programmer"
arch=("x86_64")
url="https://github.com/kost/${pkgbase}"
license=("BSD")

depends=("libftdi")
makedepends=("cmake")

source=("${pkgbase}-${pkgver}::https://github.com/kost/${pkgbase}/archive/v${pkgver}.tar.gz")
sha1sums=('9197d526d3c197ce1dd84608c67888f4c2411205')
sha256sums=('010849b0b162ec445daa1fa7af7b0a056efa8ad363738fc23ac000ebae53d02a')

build() {
    cmake -B build -S "${pkgbase}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
    install -Dm644 "$pkgbase-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
