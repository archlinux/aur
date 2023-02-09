# Maintainer: loathingkernel <username ta gmail tod com>
# Contributor: Mikołaj Chwalisz <m.chwalisz@gmail.com>
# Contributor: archlinux.info:tdy

pkgname=vitables
pkgver=3.0.2
pkgrel=4
pkgdesc="A GUI browser and editor for PyTables/HDF5 files"
arch=(any)
url=https://vitables.org
license=(GPL3)
depends=(
  'python-pyqt5'
  'python-qtpy'
  'python-pytables'
)
makedepends=(
  'python-sphinx'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/uvemas/ViTables/archive/v$pkgver.tar.gz"
  "https://github.com/uvemas/ViTables/commit/b6f1a8164f56d793f1f4f8cc4132c4cd9af8c374.patch"
  "vitables.desktop"
  "vitables.svg"
)

prepare() {
  cd ViTables-"$pkgver"
  patch -p1 -i "$srcdir"/b6f1a8164f56d793f1f4f8cc4132c4cd9af8c374.patch
}

build() {
  cd ViTables-"$pkgver"
  python setup.py build
}

package() {
  cd ViTables-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -d "$pkgdir"/usr/share/{applications,pixmaps,doc}
  install -m644 "$srcdir"/vitables.desktop "$pkgdir"/usr/share/applications/
  install -m644 "$srcdir"/vitables.svg "$pkgdir"/usr/share/pixmaps/
}

sha256sums=('43a965a08124fe0e1974aed27a7149cdeaf75e8ae833e95a18a94d7d5bd506c8'
            '1b57d7e8844fa51facba75b78c5f890c04e510b83aa650715bc6a961c6338e2d'
            'dd793f85d81591edd837a5fb94642dbf3ba488c69c605cbc2c87f74baea8676c'
            '0be6fdeb2c1f40fe2c478b0a6b9f99bad170d69f1210300d736bb98a5b9edcd8')
