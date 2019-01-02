# Maintainer: Philipp A. <flying-sheep@web.de>

_name=flit
pkgname=flit-git
pkgver=1.2.1.r24.gd0758b7
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$_name.readthedocs.io"
license=('BSD')
provides=($_name)
conflicts=($_name)
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=('python-pip')
source=("${_name}::git+https://github.com/takluyver/$_name.git")
sha256sums=('SKIP')
noextract=("$_wheel")

pkgver() {
	cd "$_name"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_name"
	python -m flit build
	ver=$(python -c 'import flit; print(flit.__version__)')
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "dist/$_name-$ver-py3-none-any.whl"
}
