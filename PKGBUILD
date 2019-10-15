# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.41
pkgrel=1
pkgdesc='Razer mouse configuration tool'
arch=('x86_64')
url=https://bues.ch/cms/hacking/razercfg
license=('GPL')
depends=('hicolor-icon-theme' 'libusb' 'python')
makedepends=('cmake')
optdepends=('python-pyqt5: for the graphical qrazercfg tool')
provides=('razerd')
backup=('etc/razer.conf')
source=("https://bues.ch/razercfg/razercfg-$pkgver.tar.bz2"{,.asc})
sha512sums=('a24f3d2187f0791459e1f7a86583f72e6bfd9fc81fda6fa3482f3351dc641f8a511339b5c3b041c3e88a7d5da35a641696e86ce7d46b3fdb6a125bc7fed78a87'
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
