# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=2.2
pkgrel=1
pkgdesc="A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
makedepends=('go')
source=("auth-thu-$pkgver.tar.gz::https://github.com/z4yx/GoAuthing/archive/v$pkgver.tar.gz"
        "auth-thu.service"
        "auth-thu.timer")
sha256sums=('77ee5083610f418cd9cd4768cbf81011f000f69ab25e442fe7fd39248c9900e3'
            'd177a5a97e9e9c40a0aa4430024a68a5a08b3ac9ab5a11ce7e2e36185d04341c'
            'a780ea89449aa17d9fafa969dcfaf2e1deaa5098c39dcf38701415ef0dee5f78')

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

