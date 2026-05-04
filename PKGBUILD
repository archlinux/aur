# Maintainer: loathingkernel <username ta gmail tod com>
# Contributor: Mikołaj Chwalisz <m.chwalisz@gmail.com>
# Contributor: archlinux.info:tdy

pkgname=vitables
pkgver=3.1.0
pkgrel=1
pkgdesc="A GUI browser and editor for PyTables/HDF5 files"
arch=(any)
url=https://vitables.org
license=(GPL3)
depends=(
  python-{build,installer,wheel}
  python-setuptools-scm
  'python-pyqt5'
  'python-qtpy'
  'python-pytables'
)
makedepends=(
  'python-hatch'
  'python-sphinx'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/uvemas/ViTables/archive/v$pkgver.tar.gz"
  "vitables.desktop"
  "vitables.svg"
)

prepare() {
  cd ViTables-"$pkgver"
}

build() {
  cd ViTables-"$pkgver"
  python -m build -wn
}

package() {
  cd ViTables-"$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
  install -d "$pkgdir"/usr/share/{applications,pixmaps,doc}
  install -m644 "$srcdir"/vitables.desktop "$pkgdir"/usr/share/applications/
  install -m644 "$srcdir"/vitables.svg "$pkgdir"/usr/share/pixmaps/
}

sha256sums=('5397e5143dd2153a57c099375a483340fd6ad701a9b972080226836b4b1bdaf9'
            'dd793f85d81591edd837a5fb94642dbf3ba488c69c605cbc2c87f74baea8676c'
            '0be6fdeb2c1f40fe2c478b0a6b9f99bad170d69f1210300d736bb98a5b9edcd8')
