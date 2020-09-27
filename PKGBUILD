# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=1.9.3
pkgrel=1
pkgdesc="A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
makedepends=('go')
source=("auth-thu-$pkgver.tar.gz::https://github.com/z4yx/GoAuthing/archive/v$pkgver.tar.gz"
        "auth-thu.service")
sha256sums=('f14759326419622871ce1ae8f54d29182529d38546938a7b0636fd34d3eb4ab3'
            '476e9a9f4442a5d6a0f0145bae40cc468710f8d8f121fce6eedce67fbacc32b3')

build() {
    cd "GoAuthing-$pkgver"
    CGO_ENABLED=0 go build -ldflags="-s -w" -o auth-thu ./cli
}

package() {
    cd "GoAuthing-$pkgver"
    install -Dm755 "auth-thu" "$pkgdir/usr/bin/auth-thu"
    install -Dm644 "$srcdir/auth-thu.service" "$pkgdir/usr/lib/systemd/user/auth-thu.service"
}
