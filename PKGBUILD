# Maintainer: Mykola Orliuk <virkony+aur at gmail dot com>

# This package useful to apply work-around described in:
#  * https://answers.launchpad.net/ubuntu/+question/135094
#  * https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/781556
#  * https://techienotes.blog/2014/06/26/how-to-fix-bluetooth-problem-on-hp-laptops-with-ubuntu-or-similar/

pkgname=bluez-bccmd
pkgver=5.55
pkgrel=2
pkgdesc="deprecated bccmd tool from bluez-${pkgver}"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('bluez-libs')
makedepends=('pkgconf')
source=("https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz")
sha256sums=('8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88')

build() {
  cd "bluez-${pkgver}"
  gcc tools/{bccmd,csr*,ubcsp}.c -o tools/bccmd -I. $(pkg-config --cflags --libs bluez)
}

package() {
  cd "bluez-${pkgver}"
  install -Dm0755 tools/bccmd "$pkgdir"/usr/bin/bccmd
  install -Dm0644 tools/bccmd.1 "$pkgdir"/usr/share/man/man1/bccmd.1
}
