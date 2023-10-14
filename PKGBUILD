# Maintainer: Simon Sorg <simon.sorg@student.hpi.de>
_dirname=pyannote-core
_pkgname=pyannote.core
pkgname=python-$_pkgname-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=5.0.0.g13a43c2
pkgrel=2
pkgdesc="Advanced data structures for handling temporal segments with attached labels."
arch=('any')
url="https://github.com/pyannote/pyannote-core"
license=('MIT')
depends=(
  'python-sortedcontainers'
  'python-numpy'
  'python-scipy'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-pytest'
)

provides=("$_pkgname")
conflicts=(${provides[@]})
source=("$_dirname"::"git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_dirname"
	printf "%s" "$(git describe --tags | cut -d "-" -f 1,3 | sed 's/.*v//' | sed 's/-/./')"
}

build() {
	cd "$srcdir/$_dirname"
	python -m build --no-isolation --wheel
}

package() {
	cd "$srcdir/$_dirname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

