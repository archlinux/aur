# Maintainer: willemw <willemw12@gmail.ccom>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Lex Black <autumn-wind at web dot de>

_pkgname=uRSSus
pkgname=urssus
pkgver=0.2.13
pkgrel=14
pkgdesc="Multiplatform PyQt-based RSS news aggregator"
arch=('any')
url="http://urssus.googlecode.com/"
license=('GPL2' 'LGPL2')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'python2-elixir'
         'python2-processing' 'python2-pyqt' 'python2-simplejson')
makedepends=('desktop-file-utils' 'python2-setuptools')  # 'python2-paver'
install=$pkgname.install
source=(https://pypi.python.org/packages/source/u/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('43c49f800c67d5898cea70dc146ca1f7')

prepare() {
  cd $_pkgname-$pkgver

  # Patch
  sed -i '/pyxml/d' uRSSus.egg-info/requires.txt pavement.py
}

package() {
  cd $_pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 uRSSus.desktop "$pkgdir/usr/share/applications/uRSSus.desktop"
  install -Dm644 urssus/images/urssus.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/urssus.png"

  # Additional license information
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

