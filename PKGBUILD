# Maintainer: willemw <willemw12@gmail.ccom>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=urssus
pkgver=0.2.13
pkgrel=15
pkgdesc="Multiplatform PyQt-based RSS news aggregator"
arch=('any')
url="https://pypi.org/project/uRSSus"
license=('GPL2' 'LGPL2')
depends=('desktop-file-utils' 'python2-elixir' 'python2-processing' 'python2-pyqt' 'python2-simplejson')
makedepends=('python2-setuptools')  # 'python2-paver'
source=($pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/u/${url##*/}/${url##*/}-$pkgver.tar.gz)
sha256sums=('7f4e5a77e231da207c4a91ae9a59775d8e42df3bda48faaecee00f67a57cf331')

prepare() {
  cd ${url##*/}-$pkgver

  # Patch
  sed -i '/pyxml/d' uRSSus.egg-info/requires.txt pavement.py
}

package() {
  cd ${url##*/}-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 uRSSus.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 urssus/images/urssus.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"

  # Additional license information
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

