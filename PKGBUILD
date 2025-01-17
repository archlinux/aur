# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.3.3
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
sha256sums=('75c90c7e1bde1ccad5bfb98752f3511a4d87741de9c19b5b1420c86e5660bbb1'
            '76773940aa14cc490bfa1eaaf05330bfdd84b189b7f3e5a75d31947588b0a84e')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
    cd "GoAuthing-$pkgver/docs/systemd"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" ./*/*.service
    install -Dm644 user/*.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 system/*.service -t "$pkgdir/usr/lib/systemd/system"
}
