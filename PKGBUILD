# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch
pkgver=4.1
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
makedepends=(git make gcc)
depends=(pciutils libcurl-gnutls)
conflicts=(albafetch-git albafetch-bin)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

md5sums=('aa247e6a081a775b11b114b898843325')

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir/usr/bin/"
    make CC=gcc INSTALLPATH="$pkgdir/usr/bin" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 MANUAL.md "$pkgdir/usr/share/doc/${pkgname}/MANUAL.md"

    mkdir -p "$pkgdir/etc/xdg"
    cat ../../template.conf albafetch.conf > "$pkgdir/etc/xdg/albafetch.conf.example"
}

