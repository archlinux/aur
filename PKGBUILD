# Maintainer Alexey Manukhin <axxapy@gmail.com>

pkgname=libwacom1
pkginame=libwacom
pkgver=1.12.1
pkgrel=2
pkgdesc="Library to identify Wacom tablets and their features (provides libwacom.so.2)"
arch=('x86_64')
url="https://github.com/linuxwacom/libwacom/wiki"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev' 'libwacom')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
source=(https://github.com/linuxwacom/libwacom/releases/download/${pkginame}-${pkgver}/${pkginame}-${pkgver}.tar.bz2) sha512sums=('944da1b23c1183d7b1bc1f44fc8420fb834e04ac1139c8bc71b79f35d0559e3c6001a6c51ad8fb2e73a8c0cfe371a638401ff6519f879ae4a266b0c5d52bb26f')

build() {
  meson build $pkginame-$pkgver \
    --prefix=/usr
  ninja -C build
}

check() {
  ninja test -C build
}

package() {
  install -D -m644 $srcdir/build/libwacom.so.2.6.1 "${pkgdir}/usr/lib/libwacom.so.2.6.1"
  install -D -m644 $srcdir/build/libwacom.so.2 "${pkgdir}/usr/lib/libwacom.so.2"
  install -D -m644 $pkginame-$pkgver/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

