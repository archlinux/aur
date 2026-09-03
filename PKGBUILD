# Maintainer: Bingusfan360 <bingusfan360@proton.me>
pkgname=mahoragaos
pkgver=0.6.2
pkgrel=1
pkgdesc="An agentic backend that *will* be the best"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.6.2/MahoragaOS-v0.6.2.tar.gz"
        "mahoragaos.desktop"
        "mahoragaos.svg")
sha256sums=('6c9ec8d0a7a25f7a40414a8277cc544c808c3da9bcc27784e42a26961691d886'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.6.2
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v0.6.2
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file
  install -Dm644 "$srcdir/mahoragaos.desktop" "$pkgdir/usr/share/applications/mahoragaos.desktop"

  # Install icon
  install -Dm644 "$srcdir/mahoragaos.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mahoragaos.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
