# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.42
pkgrel=3
pkgdesc='Razer mouse configuration tool'
arch=('x86_64')
url=https://bues.ch/cms/hacking/razercfg
license=('GPL')
depends=('hicolor-icon-theme' 'libusb' 'python')
makedepends=('cmake')
optdepends=('python-pyqt5: for the graphical qrazercfg tool')
provides=('razerd')
backup=('etc/razer.conf')
source=("https://bues.ch/razercfg/razercfg-$pkgver.tar.xz"{,.asc})
sha512sums=('3856f4133b620fb639a46a5bb02fe8e6c47ae3928a04fe9d1bbef2792a44fdd4f5dff2efa43a1e43d75312025d3c65c626e331e723092e4e0b8d6622657fb197'
            'SKIP')
validpgpkeys=('757FAB7CED1814AE15B4836E5FB027474203454C') # Michael Busch

build() {
  cd razercfg-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd razercfg-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir"/etc razer.conf
  install -Dm644 tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/razerd.conf
}

# vim:set ts=2 sw=2 et:
