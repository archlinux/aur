# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=1.9.7
pkgrel=2
pkgdesc="A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
makedepends=('go')
source=("auth-thu-$pkgver.tar.gz::https://github.com/z4yx/GoAuthing/archive/v$pkgver.tar.gz"
        "auth-thu.service"
        "auth-thu.timer")
sha256sums=('92e7a0e14c4a9ef7a0be0016d3debc8206d356ec95946597baf29246b89af7ab'
            'f1f24c538f5ca3221c270751b73c66185cabc13ef486431c05ced5790b585661'
            '89a590bc24500defb5ba59180e4bff4ba60ad5c851cea684e85c3a2886efe185')

build() {
    cd "GoAuthing-$pkgver"
    CGO_ENABLED=0 go build -ldflags="-s -w" -o auth-thu ./cli
}

package() {
    cd "GoAuthing-$pkgver"
    install -Dm755 "auth-thu" "$pkgdir/usr/bin/auth-thu"
    install -Dm644 "$srcdir/auth-thu.service" "$pkgdir/usr/lib/systemd/user/auth-thu.service"
    install -Dm644 "$srcdir/auth-thu.timer" "$pkgdir/usr/lib/systemd/user/auth-thu.timer"
}
