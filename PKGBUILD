# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.4.0
pkgrel=1
provides=('auth-thu')
conflicts=('auth-thu')
pkgdesc='A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool'
arch=('x86_64')
url='https://github.com/z4yx/GoAuthing'
license=('GPL-3.0-only')
source=(
  "$pkgname-$pkgver::$url/releases/download/v$pkgver/auth-thu.linux.$CARCH"
  "$url/archive/v$pkgver.tar.gz"
)
sha256sums=('e016433751bf0b0a59658486c0b1c67aa1152e55f2f1aaca3947d3aae771870f'
            'bd05ebe3849eec1318f4a37e5042538a5c71b1ea3baad92e52a38967fc4fd650')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
    cd "GoAuthing-$pkgver/docs/systemd"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" ./*/*.service
    install -Dm644 user/*.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 system/*.service -t "$pkgdir/usr/lib/systemd/system"
}
