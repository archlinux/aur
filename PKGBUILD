# Maintainer: Bingusfan360 <bingusfan360@proton.me>
pkgname=mahoragaos
pkgver=0.5.2
pkgrel=1
pkgdesc="An agentic backend that *will* be the best"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v$pkgver/MahoragaOS-v$pkgver.tar.gz"
        "mahoragaos.desktop"
        "mahoragaos.svg")
sha256sums=('5f0ea4817e8efb2f72b668a53c82c8b1030e9eb5a97d619b4e27aa1bce64f06a'
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
