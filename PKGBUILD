# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=go-sendxmpp-git
pkgver=0.10.0.r12.g95a2f67
pkgrel=1
pkgdesc='A tool to send messages or files to an XMPP contact or MUC'
url='https://salsa.debian.org/mdosch/go-sendxmpp'
makedepends=('git' 'go')
arch=('x86_64' 'aarch64')
license=('BSD-2-clause')
source=('git+https://salsa.debian.org/mdosch-guest/go-sendxmpp.git')
sha256sums=('SKIP')

pkgver() {
    cd go-sendxmpp
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd go-sendxmpp
    go build
}

package() {
    cd go-sendxmpp

    for i in 1 5; do
        install -Dm644 man/go-sendxmpp.$i -t "$pkgdir/usr/share/man/man$i"
    done
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 go-sendxmpp -t "$pkgdir/usr/bin"
}
