# Maintainer: Ben Morgan <neembi@gmail.com>
pkgname=mywire-connect
pkgver=0.10
pkgrel=3
epoch=
pkgdesc="Automatically complete the login process to a mywire internet connection"
arch=('i686' 'x86_64')
url="https://github.com/cassava/mywire-connect"
license=('MIT')
options=('!strip')
makedepends=('git' 'go')
optdepends=('dbus: support for desktop notifications')
source=("git+https://github.com/cassava/mywire-connect.git#tag=v$pkgver")
md5sums=('SKIP')
_magic=src/github.com/cassava/mywire-connect

prepare() {
    export GOPATH="$srcdir"
    cd "$srcdir"
    mkdir -p $(dirname $_magic)
    mv "$pkgname" "$_magic"
    # github.com/goulash/notify is a dependency of mywire-connect
    go get "github.com/goulash/notify"
}

build() {
    export GOPATH="$srcdir"
    cd "$srcdir/$_magic"
    go build -o "$pkgname"
}

package() {
    cd "$srcdir/$_magic"
    install -m755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
