pkgname=runa-bin
_pkgname=Runa
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphical AUR package manager for Arch Linux"
arch=('any')
url="https://github.com/Rune-Linux/${_pkgname}"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'git' 'pacman')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2af6bb4f7b592677516ba9ff701c7c44536aafcc1b99af6f0cb7d76a19b1a12b')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 data/rune-aur-helper.desktop \
    "$pkgdir/usr/share/applications/rune-aur-helper.desktop"
}

