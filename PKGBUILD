# Maintainer: Martino Pilia <martino.pilia@gmail.com>
pkgname=dazel
pkgver=0.0.42
pkgrel=1
epoch=
pkgdesc="Run Bazel in a Docker container via a seamless proxy"
arch=('any')
url="https://github.com/nadirizr/dazel"
license=('MIT')
depends=(
    python
)
makedepends=(
    python-build
    python-installer
    python-wheel
)
provides=('dazel')
conflicts=('dazel')
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/nadirizr/dazel/refs/heads/master/LICENSE"
)
sha256sums=('244efe192ec3a6e1680b62cadddbd8be3b4e77347114c1f381945fbeb1810ed4'
            '2ec5ab429a9186dc3b3e87dfec975b8f305ea312540306ef6591852c9cc97f62')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

	install -D -m644 \
		"${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
