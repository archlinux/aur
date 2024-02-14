# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-git
pkgver=4.1.r30.aa1b169
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original (latest commit)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
makedepends=(git make gcc)
depends=(pciutils libcurl-gnutls)
conflicts=(albafetch albafetch-bin)
provides=(albafetch)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "4.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd albafetch
    mkdir -p "$pkgdir/usr/bin"
    make CC=gcc INSTALLPATH="$pkgdir/usr/bin" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 MANUAL.md "$pkgdir/usr/share/doc/${pkgname}/MANUAL.md"

    mkdir -p "$pkgdir/etc/xdg"
    cat ../../template.conf albafetch.conf > "$pkgdir/etc/xdg/albafetch.conf.example"
}

