# Maintainer: Bingusfan360 <bingusfan360@proton.me>
pkgname=mahoragaos
pkgver=0.6.0.rc1
pkgrel=1
pkgdesc="An agentic backend that *will* be the best"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.6.0-RC1/MahoragaOS-v0.6.0-RC1.tar.gz"
        "mahoragaos.desktop"
        "mahoragaos.svg")
sha256sums=('b50624e0f53d1a1755fedf6e5c6eec6a716cc54ebde4c35a05d40a19b04db282'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.6.0-RC1
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v0.6.0-RC1
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file
  install -Dm644 "$srcdir/mahoragaos.desktop" "$pkgdir/usr/share/applications/mahoragaos.desktop"

  # Install icon
  install -Dm644 "$srcdir/mahoragaos.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mahoragaos.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
