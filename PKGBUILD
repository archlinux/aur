# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=postie-bin
pkgver=0.0.33
pkgrel=1
pkgdesc="NZB uploader"
arch=('x86_64')
url="https://github.com/kipsilabs/postie"
license=('MIT')
options=(!strip !debug)
source=(
    "https://github.com/kipsilabs/postie/releases/download/v${pkgver}/postie-cli_v${pkgver}_linux_amd64.tar.gz"
    "https://github.com/kipsilabs/postie/releases/download/v${pkgver}/postie-web-linux-amd64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/kipsilabs/postie/refs/heads/main/LICENSE"
    "postie.service"
    "postie.sysusers"
    "postie.tmpfiles"
)
sha256sums=(
    'ff0393a31b02546ea70a4f3b9dbcb4474e30c921d77a353cdaaea2e87e4f7510'
    '0cfb298961d09fccc2799105f5b6f05e06dd0bcc600980166ec8604c99173c87'
    '18e2f19467d70b1305011e1afc0a569c959a75a0b610f9457f552fa410d6a3c7'
    'cb96bc5e276b5816e5d4e930141f028637bf0b5a701b6f482d0ff58ac83e3f17'
    '6e2c939ae4a5759117a42913e98783bd9189cf160ed299b02cb045fc3f838974'
    'bbcf7e3fdd98c0d9f67bd40a21bb40e3c8c7404c9fdd594d74fcf9736025b354'
)

package() {
    depends=('glibc' 'libgcc' 'libstdc++')
    install -Dm755 "$srcdir/postie-cli-linux-amd64" "$pkgdir/usr/bin/postie"
    install -Dm755 "$srcdir/postie-web-linux-amd64" "$pkgdir/usr/bin/postie-web"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/postie.service" "$pkgdir/usr/lib/systemd/system/postie.service"
    install -Dm644 "$srcdir/postie.sysusers" "$pkgdir/usr/lib/sysusers.d/postie.conf"
    install -Dm644 "$srcdir/postie.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/postie.conf"
}

