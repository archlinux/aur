# Maintainer: Rob Cornish <jrmcornish AT gmail DOT com>
# Contributer: Peter Jackson <pete@peteonrails.com>
# Contributor: Mikolaj Pastuszko <deluminathor@gmail.com>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=brscan3
pkgver=0.2.13_1
pkgrel=3
pkgdesc="Brother SANE drivers for $pkgname-compatible models"
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('GPL' 'custom:Brother')
depends=('sane' 'libusb-compat')
install=brscan3.install

source_i686=("http://download.brother.com/welcome/dlf006643/${pkgname}-${pkgver/_/-}.i386.rpm")
sha256sums_i686=('5586fe264c7bd715e598b5d444f2851464ffe72857f2f48486466e7e2957f792')

source_x86_64=("http://download.brother.com/welcome/dlf006644/${pkgname}-${pkgver/_/-}.x86_64.rpm")
sha256sums_x86_64=('b462dbded2d0f7ae511057bd3cb6f8379042b75d996eef2675998a4559cc5556')

source=('brscan3.rules' 'LICENSE.html')
sha256sums=('2e73148e0b89e0753d3cbfe99837efd3ebf06d9d9e3b030b4a241fa8fb5b662b'
            '3434bca1936d6a5fd6afd810cde7e1876dd4d1496722b09af180278480f464f2')

package() {
  cp -r "$srcdir"/usr "$pkgdir"

  install -d -m755 "$pkgdir"/etc/udev/rules.d
  install -D -m644 "$srcdir"/brscan3.rules "$pkgdir"/etc/udev/rules.d

  install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
  install -D -m644 "$srcdir"/LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname

  cd "$pkgdir"/usr/lib
  ln -sf libbrscandec3.so.1.0.0 libbrscandec3.so.1
  ln -sf libbrscandec3.so.1 libbrscandec3.so

  cd "$pkgdir"/usr/lib/sane
  ln -sf libsane-brother3.so.1.0.7 libsane-brother3.so.1
  ln -sf libsane-brother3.so.1 libsane-brother3.so
}
