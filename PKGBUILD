# Maintainer: veecue <veecue@ventos.tk>

pkgname=pacmon-git
pkgver=20171022
pkgrel=1
pkgdesc="An automated LAN mirror for pacman"
arch=('any')
url="https://github.com/veecue/pacmon"
license=('GPL')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=('pacmon.service' 'pacmon-mirrorlist.hook')
sha256sums=('fb0cdc6bf8a79c518ded1a5c9cc44e2b26f3ea3adee8947c4746d5996c3b75a2' '82f0a263cc0ebc08e43043d8dec5118afb56f5bbaef64a2021dc0b43f6671c5a')
install=pacmon.install
_gourl=github.com/veecue/pacmon

build() {
  GOPATH="$srcdir" go get -fix -v -x $_gourl
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x $_gourl
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -p -m644 "$srcdir/pacmon.service" "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/share/libalpm/hooks"
  install -p -m644 "$srcdir/pacmon-mirrorlist.hook" "$pkgdir/usr/share/libalpm/hooks"
}

# vim:set ts=2 sw=2 et:
