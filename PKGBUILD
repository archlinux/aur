# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.3.5
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
sha256sums=('8066c11e3e1497156d61f643b670a40c3a5ef1bbc136ba3dc287d0c4c7b23777'
            'd380777283645c1058ed4667bfd5eb26e4a473e363554c333fe802785664a305')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
    cd "GoAuthing-$pkgver/docs/systemd"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" ./*/*.service
    install -Dm644 user/*.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 system/*.service -t "$pkgdir/usr/lib/systemd/system"
}
