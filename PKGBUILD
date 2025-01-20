# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.3.4
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
sha256sums=('ec95fd1ad430c614ce70b0b3a5ec374f339194fad21d74de3a5ffc657800c2f5'
            'c3746785542cbebeb51f81e33d1257dc9ccc365822c5b9ec982951098602c91f')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
    cd "GoAuthing-$pkgver/docs/systemd"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" ./*/*.service
    install -Dm644 user/*.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 system/*.service -t "$pkgdir/usr/lib/systemd/system"
}
