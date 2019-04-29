# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=elo-single-touch-usb-driver
pkgver=5.1.0
pkgrel=1
pkgdesc="Elo Systems Touchscreen Single-Touch USB driver"
arch=("x86_64")
url="https://www.elotouch.com"
license=("EULA")
depends=("libusb" "openmotif")
source=("$pkgname-$pkgver::https://assets.ctfassets.net/of6pv6scuh5x/2iZOZUJHBw0hNGCxMg8soh/76cabfd2309fbadf0b68e17dbeb9cde9/SW602650_Elo_Linux_ST_USB_Driver_v5.1.0_x86_64.tar")
md5sums=("126494765769642100bc51b0843d26d9")

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/opt"
  mkdir -p "$pkgdir/etc/udev/rules.d"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  cp -r "$srcdir/bin-usb" "$pkgdir/etc/opt/elo-usb"
  cp -a "$pkgdir/etc/opt/elo-usb/99-elotouch.rules" "$pkgdir/etc/udev/rules.d"
  cp -a "$pkgdir/etc/opt/elo-usb/elo.service" "$pkgdir/usr/lib/systemd/system"

  ln -sf "/etc/opt/elo-usb/elousbd" "$pkgdir/usr/bin/elousbd"
  ln -sf "/etc/opt/elo-usb/elova" "$pkgdir/usr/bin/elova"
}
