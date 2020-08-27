# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname='auth-thu'
pkgver=1.6.1
pkgrel=1
pkgdesc="Authentication utility for srun4000 (auth.tsinghua.edu.cn / auth4.tsinghua.edu.cn / Tsinghua-IPv4)"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=(
    "auth-thu-$pkgver.tar.gz::https://github.com/z4yx/GoAuthing/archive/v$pkgver.tar.gz"
    "auth-thu.service")
sha256sums=('b876ec554eb00ed0e85964548781e5e59d62e74218985f08df84a4bc58c8618f'
            '70b6f9881ead54da946636a93807e2a7b1f262959b4faa1fabc5b2592b76c2fc')

build() {
    cd "GoAuthing-$pkgver"
    GO111MODULE=on
    CGO_ENABLED=0
    go build -trimpath -buildmode=pie -ldflags -extldflags=-Wl,-z,now,-z,relro -o auth-thu ./cli
}

package() {
    install -Dm755 "GoAuthing-$pkgver/auth-thu" "$pkgdir/usr/bin/auth-thu"
    install -Dm644 "$srcdir/auth-thu.service" "$pkgdir/usr/lib/systemd/user/auth-thu.service"
}
