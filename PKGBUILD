# Maintainer: Simon Sorg <simon.sorg@student.hpi.de>
_dirname=pyannote-database
_pkgname=pyannote.database
pkgname=python-$_pkgname-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=5.0.1.gbac3225
pkgrel=1
pkgdesc="Reproducible experimental protocols for multimedia (audio, video, text) database"
arch=('any')
url="https://github.com/pyannote/pyannote-database"
license=('MIT')
depends=(
  'python-pyannote.core-git'
  'python-yaml'
  'python-pandas'
  'python-typer'
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


