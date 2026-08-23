# Maintainer: Bingusfan360 <bingusfan360@proton.me>
pkgname=mahoragaos
pkgver=0.4.11
pkgrel=1
pkgdesc="A model-agnostic adaptive operating system inspired by the Unix philosophy"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v$pkgver/MahoragaOS-v$pkgver.tar.gz"
        "mahoragaos.desktop"
        "mahoragaos.svg")
sha256sums=('5ad1b892d6113af793a2c0fe0599353671e6837be11e48c501d8c4b0273261fc'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v$pkgver
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v$pkgver
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file
  install -Dm644 "$srcdir/mahoragaos.desktop" "$pkgdir/usr/share/applications/mahoragaos.desktop"

  # Install icon
  install -Dm644 "$srcdir/mahoragaos.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mahoragaos.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
