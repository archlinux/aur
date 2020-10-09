# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=1.9.7
pkgrel=1
pkgdesc="A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
makedepends=('go')
source=("auth-thu-$pkgver.tar.gz::https://github.com/z4yx/GoAuthing/archive/v$pkgver.tar.gz"
        "auth-thu.service")
sha256sums=('92e7a0e14c4a9ef7a0be0016d3debc8206d356ec95946597baf29246b89af7ab'
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
