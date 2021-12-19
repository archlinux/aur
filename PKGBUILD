# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=yandex-cloud-bin
pkgver=0.86.0
pkgrel=3
pkgdesc='Yandex.Cloud CLI'
arch=('x86_64')
url='https://cloud.yandex.ru/docs/cli/'
license=()
depends=()
makedepends=()
provides=('yandex-cloud')
source=("yc-$pkgver::https://storage.yandexcloud.net/yandexcloud-yc/release/${pkgver}/linux/amd64/yc")
md5sums=('3c3b4eb6689beb25c877017e974a9e85')

# TODO: Get the latest stable version.
#pkgver() {
#    curl "https://storage.yandexcloud.net/yandexcloud-yc/release/stable"
#}

build() {
    cd "$srcdir"
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "yc-$pkgver" "$pkgdir/usr/bin/yc"
    chmod +x "$pkgdir/usr/bin/yc"

    $pkgdir/usr/bin/yc components post-update > /dev/null 2>&1
    rm -rf $pkgdir/usr/*.inc

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    $pkgdir/usr/bin/yc completion bash > "$pkgdir/usr/share/bash-completion/completions/yc"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    $pkgdir/usr/bin/yc completion zsh > "$pkgdir/usr/share/zsh/site-functions/_yc"
}
