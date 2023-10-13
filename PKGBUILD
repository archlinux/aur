# Maintainer: Simon Sorg <simon.sorg@student.hpi.de>
_pkgname=asteroid-filterbanks
pkgname=python-$_pkgname-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.4.0.ge15bb3f
pkgrel=1
pkgdesc="The PyTorch-based audio source separation toolkit for researchers"
arch=('any')
url="https://asteroid-team.github.io/"
license=('MIT')
depends=(
  'python-numpy'
  'python-scipy'
  'python-pytorch'
  'python-librosa'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=("$_pkgname"::"git+https://github.com/asteroid-team/asteroid-filterbanks")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --tags | cut -d "-" -f 1,3 | sed 's/.*v//' | sed 's/-/./')"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --no-isolation --wheel
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
