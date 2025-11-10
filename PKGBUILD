# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-transkribus_metagrapho_api
_pkg="${pkgname#python-}"
pkgver=0.1.5
pkgrel=1
pkgdesc="Python bindings for the Transkribus Metagrapho/Processing API."
url="https://github.com/jnphilipp/transkribus_metagrapho_api"
depends=('python-pillow' 'python-requests')
makedepends=('python-build' 'python-installer')
license=('GPL3+')
arch=(any)
source=("git+https://github.com/jnphilipp/transkribus_metagrapho_api")
sha256sums=(SKIP)

build() {
	cd $_pkg
    python -m build --wheel --no-isolation
    make changelog.latest.md
}

package() {
	cd $_pkg
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 changelog.latest.md "${pkgdir}"/usr/share/doc/${pkgname}/changelog.latest.md
}
