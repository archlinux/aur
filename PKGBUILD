# Maintainer: sfn

pkgname=python-pyseq
pkgver=0.9.0
pkgrel=2
pkgdesc="Python sequence string module"
arch=(any)
url="https://pyseq.rsgalloway.com/#"
license=('BSD-3-Clause ')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'git')
source=("${pkgname}::git+https://github.com/rsgalloway/pyseq.git#tag=${pkgver}")
sha256sums=('SKIP')

_name=${pkgname#python-}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}"
	ls dist/
	python -m installer --destdir="$pkgdir/usr/lib/python3.13/site-packages/$_name" dist/*.whl
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
