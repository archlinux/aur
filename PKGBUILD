# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.3
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
sha256sums=('5585c980cf1ba94e8494c2f22a3eaf98009a784317c5036acf22cf0454a89c5e'
            '56b7daa31b961cfb1b5db3769bd02ad87ff965aa274adeee0ceaf8b091625d37')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
    cd "GoAuthing-$pkgver/docs/systemd"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" ./*/*.service
    install -Dm644 user/*.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 system/*.service -t "$pkgdir/usr/lib/systemd/system"
}
