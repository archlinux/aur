# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dashon Wells <me@me.me>
pkgname=catt-qt
pkgver=5.1
pkgrel=1
pkgdesc="Cast All The Things Qt GUI"
arch=('any')
url="https://github.com/soreau/catt-qt"
license=('GPL-3.0-or-later')
depends=(
  'catt'
  'python-pychromecast'
  'python-pyqt5'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('a6dd84c9991073434de99c56a39f472a7ed657a107eb66c6c97c43d8084884f9'
            '98011e8a1a716bbdd455bb455ef61e48b1e9a4f08f003392c796c228abbac6f4')

build() {
  cd "$pkgname-$pkgver"

  # Tries to import itself during build, define path and
  # skip checking for erroneous dependencies listed in pyproject.toml
  PYTHONPATH=. python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 cattqt/chromecast.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
