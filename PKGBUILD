# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=go-sendxmpp-git
pkgver=r42.2266cec
pkgrel=1
pkgdesc='A little tool to send messages to an XMPP contact or MUC'
url='https://salsa.debian.org/mdosch-guest/go-sendxmpp'
makedepends=('git' 'go')
arch=('x86_64')
license=('MIT')
source=('git+https://salsa.debian.org/mdosch-guest/go-sendxmpp.git')
sha256sums=('SKIP')

pkgver() {
  cd go-sendxmpp
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd go-sendxmpp
  go build
}

package() {
  cd go-sendxmpp

  for i in 1 5; do
    install -Dm644 man/go-sendxmpp.$i -t "${pkgdir}/usr/share/man/man$i"
  done
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/go-sendxmpp"
  install -Dm755 go-sendxmpp -t "$pkgdir/usr/bin"
}
