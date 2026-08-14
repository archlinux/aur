# Maintainer: Egor Tensin <egor@tensin.name>
pkgname=yandex-cloud-cli-bin
pkgver=1.26.0
pkgrel=1
pkgdesc='Yandex.Cloud CLI'
arch=('x86_64')
url='https://yandex.cloud/en/docs/cli/'
license=('unknown')
_base_url='https://storage.yandexcloud.net/yandexcloud-yc/release'
source=("yc-$pkgver::$_base_url/${pkgver}/linux/amd64/yc")
sha256sums=(SKIP)

prepare() {
    chmod +x "yc-$pkgver"
}

build() {
    "./yc-$pkgver" completion bash > yc.bash
    "./yc-$pkgver" completion fish > yc.fish
    "./yc-$pkgver" completion zsh > yc.zsh
}

package() {
    cd -- "$srcdir"

    install -D -m 755 "yc-${pkgver}" "$pkgdir/usr/bin/yc"

    install -D -m 644 yc.bash "$pkgdir/usr/share/bash-completion/completions/yc"
    install -D -m 644 yc.fish "$pkgdir/usr/share/fish/vendor_completions.d/yc.fish"
    install -D -m 644 yc.zsh  "$pkgdir/usr/share/zsh/site_functions/_yc"
}
