# Maintainer: Andrey Burov <burik666@gmail.com>

pkgname=yagostatus-git
pkgver=v1.0.0.r0.gb784b35
pkgrel=1
pkgdesc='Yet Another i3status replacement written in Go.'
arch=('x86_64' 'i686')
url='https://github.com/burik666/yagostatus'
license=('GPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=('git+https://github.com/burik666/yagostatus.git')
md5sums=('SKIP')
_gourl='github.com/burik666/yagostatus'

pkgver() {
    cd "$srcdir/yagostatus"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    GOPATH="$srcdir" go get -v "$_gourl"
}

package() {
    _gitdir="$srcdir/src/$_gourl"

    install -p -m 755 -D -t "$pkgdir/usr/bin/" "$srcdir/bin/yagostatus"
    install -m 644 -D -t "$pkgdir/usr/share/$pkgname/" "$_gitdir/README.md"
    install -m 644 -D -t "$pkgdir/usr/share/$pkgname/" "$_gitdir/yagostatus.yml"
}
