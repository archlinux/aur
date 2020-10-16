# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=1.9.7
pkgrel=4
pkgdesc="A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool"
arch=('x86_64')
url="https://github.com/z4yx/GoAuthing"
license=('GPL3')
makedepends=('go')
source=("auth-thu-$pkgver.tar.gz::https://github.com/z4yx/GoAuthing/archive/v$pkgver.tar.gz"
        "auth-thu.service"
        "auth-thu.timer")
sha256sums=('92e7a0e14c4a9ef7a0be0016d3debc8206d356ec95946597baf29246b89af7ab'
            '910871292e9ba7f960fcc34bfc8b657565f8074dac477d16cd28d4477f8a8267'
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
