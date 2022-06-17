# Maintainer: Amber <amber@mail.cyborgtrees.com>
pkgname=samson
pkgver=r259.fffbb7c
pkgrel=1
pkgdesc="a cryptanalysis and attack library"
arch=(any)
url="https://github.com/wildcardcorp/samson"
license=('custom')
depends=('python' 'python-jedi' 'python-tqdm' 'python-dill' 'python-z3' 'ipython' 'python-pyasn1' 'python-pyasn1-modules' 'python-sortedcontainers' 'python-rich' 'python-mpmath' 'python-pytest-celery' 'python-celery' 'pypy3')
makedepends=('python-sphinx' 'git' 'python-setuptools' 'python-build' 'python-installer')
optdepends=()
provides=('python-samson-crypto')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/wildcardcorp/samson.git")
md5sums=('SKIP')


pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/$pkgname"
	bash scripts/make_man.sh
	python -m build --no-isolation --wheel
#	bash ./make_doc.sh #i'll probably make this into a seperate package
}

package() {
	cd "$srcdir/$pkgname"
	#TODO: licence
	python -m installer --destdir="$pkgdir" --no-compile-bytecode dist/*.whl 
}
