# Maintainer: veecue <veecue@ventos.tk>

pkgname=pacmon-git
_pkgname=pacmon
pkgver=20180604
pkgrel=1
pkgdesc="A zero-configuration, fast and simple pacman LAN-mirror as a replacement for pacserve"
arch=('x86_64' 'i686' 'armv6' 'armv7')
url="https://github.com/veecue/pacmon"
license=('GPL')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=("$_pkgname::git+https://github.com/veecue/pacmon")
sha256sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")
install=pacmon.install

build() {
  cd "$_pkgname"
  go build -ldflags='-s -w' 
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "pacmon-mirrorlist.hook" "$pkgdir/usr/share/libalpm/hooks/pacmon-mirrorlist.hook"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
