# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname='auth-thu'
pkgver=1.4.2
pkgrel=5
pkgdesc="Authentication utility for srun4000 (auth.tsinghua.edu.cn / auth4.tsinghua.edu.cn / Tsinghua-IPv4)"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=(
    "auth-thu.tar.gz::https://github.com/z4yx/GoAuthing/archive/v1.4.2.tar.gz"
    "auth-thu.service")
sha256sums=('a005ae7ef960a4c444f61f5053ac74be035187820a1c25e52e6fb46d0d03728c'
            '70b6f9881ead54da946636a93807e2a7b1f262959b4faa1fabc5b2592b76c2fc')

build() {
    cd "GoAuthing-$pkgver"
    export GO111MODULE=on
    go build -trimpath -buildmode=pie -ldflags -extldflags=-Wl,-z,now,-z,relro -o auth-thu ./cli
}

package() {
    install -Dm755 "GoAuthing-$pkgver/auth-thu" "$pkgdir/usr/bin/auth-thu"
    install -Dm644 "$srcdir/auth-thu.service" "$pkgdir/usr/lib/systemd/user/auth-thu.service"
}
