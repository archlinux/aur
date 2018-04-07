# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=libvirt-autoballoon-git
pkgver=v0.2.r0.g392d551
pkgrel=1
pkgdesc="Libvirt-qemu autoballooning"
arch=('any')
url="https://github.com/Nefelim4ag/libvirt-autoballoon.git"
license=('GPL3')
depends=('systemd' 'bash' 'libvirt' 'libvirt-python')
makedepends=('git' 'make')
source=("$pkgname"::'git+https://github.com/Nefelim4ag/libvirt-autoballoon.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname}/"
  make install PREFIX="$pkgdir"
  mkdir -p "$pkgdir/usr/"
  mv -v "$pkgdir/lib" "$pkgdir/usr/"
}
