# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=linuxqq
pkgver=2.0.0.1082
pkgrel=1
pkgdesc="Tencent QQ for Linux"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
depends=(
    'gtk2'
    'nss'
)
source_x86_64=(
    "https://down.qq.com/qqweb/LinuxQQ_1/linuxqq_2.0.0-b2-1082_x86_64.pkg.tar.xz"
)
sha512sums_x86_64=(
    '01a5babf0fbc5e96f5ddeef3fbb6f5e766523766742d6f95ecf84d2a7f599d35dd9971ba67c8976ae7c26c5cd5f985a81e124b3621d041ebb26c7ff9db525df7'
)
source_aarch64=(
    "https://down.qq.com/qqweb/LinuxQQ_1/linuxqq_2.0.0-b2-1082_aarch64.rpm"
)
sha512sums_aarch64=(
    '9da9407a58dc9ef4361174feaef29c808241c4f77f2b543b6455211a55399baaefef8fab25c01095198b973486f6b2d4ec25e8995fe2a5502a2d45fdbd249953'
)

package() {
    mkdir -p "$pkgdir/opt"
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
