# Maintainer: Bingusfan360 <bingusfan360@proton.me>
pkgname=mahoragaos
pkgver=0.4.10
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
sha256sums=('e6f3526537caae12c4a018ba6ef8efeb7e206ef2e0bf5367e8b08586755212e2'
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
