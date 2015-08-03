pkgname="ash-mailcap-autoview"
pkgver=2.1adc2e6
pkgrel=1
pkgdesc="View Atlassian Stash review comments context directly from mail client"
url="https://github.com/seletskiy/ash-mailcap-autoview"
arch=('any')
license=('GPL')
makedepends=('go')

source=(git+https://github.com/seletskiy/ash-mailcap-autoview)

md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/$pkgname"

    rm -rf "$srcdir/.go/src"

    mkdir -p "$srcdir/.go/src"

    export GOPATH=$srcdir/.go

    mv "$srcdir/$pkgname" "$srcdir/.go/src/"

    cd "$srcdir/.go/src/$pkgname/"
    ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

    go get
}

package() {
    mkdir -p $pkgdir/usr/{bin,share/ash-mailcap-autoview}
    cp "$srcdir/.go/bin/$pkgname" "$pkgdir/usr/bin"
    cp "$srcdir/ash-mailcap-autoview/editor.template" "$pkgdir/usr/share/ash-mailcap-autoview/editor"
}
