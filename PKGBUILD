# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=2.3
pkgrel=1
pkgdesc='A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool'
arch=('x86_64')
url='https://github.com/z4yx/GoAuthing'
license=('GPL-3.0-only')
makedepends=('go')
source=("auth-thu-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'auth-thu.service'
        'auth-thu.timer')
sha256sums=('56b7daa31b961cfb1b5db3769bd02ad87ff965aa274adeee0ceaf8b091625d37'
            'd177a5a97e9e9c40a0aa4430024a68a5a08b3ac9ab5a11ce7e2e36185d04341c'
            'a780ea89449aa17d9fafa969dcfaf2e1deaa5098c39dcf38701415ef0dee5f78')

build() {
    cd "GoAuthing-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o auth-thu ./cli
}

package() {
    cd "GoAuthing-$pkgver"
    install -Dm755 auth-thu -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/auth-thu.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 "$srcdir/auth-thu.timer" -t "$pkgdir/usr/lib/systemd/user"
}

