# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe-git
pkgver=1.6.4
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
source=("git+$url")
md5sums=('SKIP')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'edid-decode')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils')
makedepends=('git')
conflicts=('hw-probe')
provides=("hw-probe=${pkgver%+*}")

pkgver() {
  cd "$srcdir/hw-probe"
  git describe --long --abbrev=10 | sed 's/-beta/beta/; s/-/+/; s/-/./'
}

package() {
  cd "$srcdir/hw-probe"
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
