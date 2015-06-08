# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname=a4tool-git
_pkgname=a4tool
pkgver=20150203
pkgrel=1
pkgdesc="Tools for control your smart mouse. A4Tech G10-700F, and other \"Oscar mouse's\"."
arch=('x86_64' 'i686')
url="https://github.com/Marisa-Chan/init-gmouse"
license=('BSD')
options=('!strip' '!emptydirs')
depends=("libusbx>=1.0" "libnotify")
source=("git://github.com/Marisa-Chan/init-gmouse.git"
	"40-a4tech-usb-devices.rules")
sha512sums=("SKIP"
  "c499bcdd5533d1b238c67508f26c3c6a2a885ae0942755ea2270ffd546022e213bb0560353b37f0e85f63dedae5c53d3b1e4107e204ba820102f9da19833fd01")
_gitname="init-gmouse"
backup=('etc/a4toold.conf')
install="a4tool.install"

build() {
  cd "$srcdir/${_gitname}/libgmouse"
  make
  cd ../a4tool
  make
}

package() {
  install -D -m644 "40-a4tech-usb-devices.rules" "$pkgdir/usr/lib/udev/rules.d/40-a4tech-usb-devices.rules"
  install -D -m755 "$_gitname/a4tool/a4tool" "$pkgdir/usr/bin/a4tool"
  #daemon
  install -D -m755 "$_gitname/a4toold/a4toold.sh" "$pkgdir/usr/share/a4tool/a4toold.sh"
  install -D -m644 "$_gitname/a4toold/Mouse.png" "$pkgdir/usr/share/a4tool/Mouse.png"
  install -D -m644 "$_gitname/a4toold/Keyboard.png" "$pkgdir/usr/share/a4tool/Keyboard.png"
  install -D -m644 "$_gitname/a4toold/a4toold.conf" "$pkgdir/etc/a4toold.conf"
}

# vim:set ts=2 sw=2 et:
