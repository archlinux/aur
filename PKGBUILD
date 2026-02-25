# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: tafli
# Contributor: maat

pkgname=brickv
pkgver=2.4.27
pkgrel=1
pkgdesc="testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('any')
depends=('python-pyserial' 'python-pyqt5' 'python-pytz' 'python-tzlocal')
optdepends=('brickd: local device support')
makedepends=('python-setuptools' 'python-pyqt5')
source=(https://download.tinkerforge.com/apt/debian/pool/main/t/tinkerforge-${pkgname}/tinkerforge-${pkgname}_${pkgver}.tar.xz)
sha256sums=('16aca82c5394774237a8b29554389c032e121bee0ace352a2fefb1289ab77787')

package() {
  install -D $srcdir/tinkerforge-$pkgname-$pkgver/usr/bin/brickv $pkgdir/usr/bin/brickv
  install -Dm644 $srcdir/tinkerforge-$pkgname-$pkgver/lib/udev/rules.d/99-tinkerforge-brickv.rules $pkgdir/usr/lib/udev/rules.d/99-tinkerforge-brickv.rules
  install -D $srcdir/tinkerforge-$pkgname-$pkgver/usr/share/applications/brickv.desktop $pkgdir/usr/share/applications/brickv.desktop
  # install does not support recursively copying a directory tree
  cp -r $srcdir/tinkerforge-$pkgname-$pkgver/usr/share/brickv $pkgdir/usr/share/brickv
  # Debian source package contains the deb marker. Overwrite it to make sure brickv checks the AUR for updates instead.
  echo "aur" > $pkgdir/usr/share/brickv/package_type
  install -Dm644 $srcdir/tinkerforge-$pkgname-$pkgver/usr/share/pixmaps/brickv-icon.png $pkgdir/usr/share/pixmaps/brickv-icon.png
}
