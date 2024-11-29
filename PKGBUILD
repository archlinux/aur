# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=hw-probe-git
pkgver=1.6.5
pkgrel=1
pkgdesc="Probe for hardware, check its operability and upload result to https://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('LGPL-2.1-or-later OR BSD-4-Clause')
source=("git+$url")
sha256sums=('SKIP')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'v4l-utils-git' 'acpica')
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
