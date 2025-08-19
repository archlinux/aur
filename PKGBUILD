# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: DoTheEvolution <DoTheEvo@gmail.com>
pkgname=angrysearch
pkgver=1.0.4
pkgrel=4
pkgdesc="Linux file search, instant results as you type"
arch=('any')
url="https://github.com/DoTheEvo/ANGRYsearch"
license=('GPL-2.0-only')

depends=('gdk-pixbuf2' 'libnotify' 'python' 'python-gobject' 'python-pyqt5' 'libxkbcommon-x11' 'xdg-utils' 'xdotool')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=("35287f7232f3892308186b33c05369ca8123647fbae6b8be0bb43f28ff052de9")

pkgver() {
  cd "$srcdir/ANGRYsearch-$pkgver"
  python setup.py --version
}

build() {
  cd "$srcdir/ANGRYsearch-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/ANGRYsearch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "$pkgdir/$_site_packages"/usr/* "$pkgdir/usr/"
  rmdir "$pkgdir/$_site_packages"/usr
}
