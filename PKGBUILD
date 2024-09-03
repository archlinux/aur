# Maintainer: Jérôme de Courval <decje9@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.43
pkgrel=10
pkgdesc='Razer mouse configuration tool'
arch=('x86_64')
url=https://bues.ch/cms/hacking/razercfg
license=('GPL-2.0-or-later')
depends=('bash' 'hicolor-icon-theme' 'libusb' 'python')
makedepends=('cmake' 'systemd' 'python-setuptools')
optdepends=('python-pyqt5: for the graphical qrazercfg tool')
provides=('razerd')
backup=('etc/razer.conf')
source=("https://bues.ch/razercfg/razercfg-$pkgver.tar.xz"{,.asc})
sha512sums=('0d852c86846f14a5da64350e8c0de5288fc9ad6dbbaf4e35b8aea4c9e11eb43269240bc13deac3a49940557846c0e6d73ebefbc26dddc11a47bcc12a3691aca7'
            'SKIP')
validpgpkeys=('757FAB7CED1814AE15B4836E5FB027474203454C') # Michael Busch

build() {
  cd razercfg-$pkgver
  RAZERCFG_PKG_BUILD=1 cmake -DCMAKE_INSTALL_PREFIX=/usr .
  cmake --build .
}

package() {
  cd razercfg-$pkgver
  RAZERCFG_PKG_BUILD=1 DESTDIR="$pkgdir" cmake --install .

  install -Dm644 -t "$pkgdir"/etc razer.conf
  install -Dm644 tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/razerd.conf
}
