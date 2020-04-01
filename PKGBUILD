# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=linuxqq
pkgver=2.0.0.1076
pkgrel=2
pkgdesc="Tencent QQ for Linux"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
depends=(
    'gtk2'
    'nss'
)
source_x86_64=(
    'http://down.qq.com/qqweb/LinuxQQ/%E5%AE%89%E8%A3%85%E5%8C%85/linuxqq_2.0.0-b2-1076_x86_64.pkg.tar.xz'
)
sha512sums_x86_64=(
    'cf88a0dc2af564f22b7f14a1b6073e17d6bf305802db1dc36b0f82d123cc75fe557a9223228ab62760aaf02fcff1c8f7c6fd826c939911df16a28cd9e56aea5f'
)
source_aarch64=(
    'http://down.qq.com/qqweb/LinuxQQ/%E5%AE%89%E8%A3%85%E5%8C%85/linuxqq_2.0.0-b2-1076_aarch64.rpm'
)
sha512sums_aarch64=(
    '05ead2b14cc0b359a7073c75542b2055bcd0728cfe11801b73280e771ef407f513280c3b6180b9e06208ef8846d59fad9d9bd9fc25c6f2c9d59af531174e821a'
)

package() {
    mkdir -p "$pkgdir/opt/"
    cp -r "$srcdir/usr/local/share/tencent-qq" "$pkgdir/opt/"

    cp "$srcdir/usr/local/bin/qq" "$pkgdir/opt/tencent-qq/"
    cp "$srcdir/usr/local/bin/crashpad_handler" "$pkgdir/opt/tencent-qq/"

    install -Dm 644 "$srcdir/usr/share/applications/qq.desktop" \
                    "$pkgdir/usr/share/applications/qq.desktop"

    sed -i 's#/usr/local/share#/opt#' "$pkgdir/usr/share/applications/qq.desktop"
    sed -i 's#/usr/local/bin#/opt/tencent-qq#' "$pkgdir/usr/share/applications/qq.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/tencent-qq/qq" "$pkgdir/usr/bin/qq"
}
