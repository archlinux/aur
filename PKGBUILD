# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-git
pkgver=4.0.r22.05a348b
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original (latest commit)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
makedepends=(git make gcc)
depends=(pciutils libcurl-gnutls)
conflicts=(albafetch albafetch-bin)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd albafetch
    mkdir -p "$pkgdir/usr/bin/"
    make CC=gcc DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

