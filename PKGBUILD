# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=postie-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="NZB uploader"
arch=('x86_64')
url="https://github.com/kipsilabs/postie"
license=('MIT')
options=(!debug)
source=(
    "https://github.com/kipsilabs/postie/releases/download/v${pkgver}/postie-rust-v${pkgver}-linux-x86_64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/kipsilabs/postie/refs/heads/main/LICENSE"
    "postie.service"
    "postie.sysusers"
    "postie.tmpfiles"
)
sha256sums=(
    '65d39e54409ebd0dbbe442ce7041ed08fcc0d5fcd55c04107b24604d46c4c0cd'
    '18e2f19467d70b1305011e1afc0a569c959a75a0b610f9457f552fa410d6a3c7'
    'fbb08954f41bfb63bbb5f8aeeea593b77541e0c8b9e704843054ba83d2330718'
    '6e2c939ae4a5759117a42913e98783bd9189cf160ed299b02cb045fc3f838974'
    'bbcf7e3fdd98c0d9f67bd40a21bb40e3c8c7404c9fdd594d74fcf9736025b354'
)

package() {
    depends=('glibc' 'libgcc' 'libstdc++')

    _srcdir="$srcdir/postie-rust-v$pkgver-linux-x86_64"
    install -Dm755 "$_srcdir/postie" -t "$pkgdir/usr/bin/"
    install -Dm755 "$_srcdir/postie-web" -t "$pkgdir/usr/bin/"
    install -dm755 "$pkgdir/var/lib/postie/frontend/"
    cp -a "$_srcdir/frontend/." "$pkgdir/var/lib/postie/frontend/"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/postie.service" "$pkgdir/usr/lib/systemd/system/postie.service"
    install -Dm644 "$srcdir/postie.sysusers" "$pkgdir/usr/lib/sysusers.d/postie.conf"
    install -Dm644 "$srcdir/postie.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/postie.conf"
}

