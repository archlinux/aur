# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=radontea
pkgname=python-${_pkgname}
pkgver=0.4.14
pkgrel=1
pkgdesc="Algorithms to compute the inverse Radon transform (e.g. SART, backprojection, Fourier interpolation)."
arch=('any')
url="https://github.com/RI-imaging/radontea"
license=('BSD')
depends=(
	'python'
	'python-setuptools'
	'python-pip'
	'python-numpy'
	'python-scipy'
)
makedepends=(
	'python-build'
	'python-installer'
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4526e032cd52d72057dfa0530702e0325d78799e42d55b44b5d7dfefab90de5e')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
