# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
#
# There is no way to get notifications on the binary update at the moment but
# one can do it manually with the following request.
#
#    curl "https://storage.yandexcloud.net/yandexcloud-yc/release/stable"

pkgname=yandex-cloud-bin
pkgver=0.122.0
pkgrel=1
pkgdesc='Yandex.Cloud CLI'
arch=('x86_64')
url='https://cloud.yandex.ru/docs/cli/'
license=('unknown')
provides=('yandex-cloud')
source=("yc-$pkgver::https://storage.yandexcloud.net/yandexcloud-yc/release/${pkgver}/linux/amd64/yc")
sha256sums=('5dd0652aabbb464a34a02f172eec02dbf5bbf4864c55d0b264bb4ede94d1b383')

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
