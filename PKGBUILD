# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-django_bootstrap5
_pkg="${pkgname#python-}"
pkgver=0.3.15
pkgrel=1
pkgdesc="Add bootstrap 5 support (css/js) to django."
url="https://github.com/jnphilipp/django_bootstrap5"
depends=('python-django')
makedepends=('python-setuptools')
license=('GPL3+')
arch=(any)
source=("git+https://github.com/jnphilipp/django_bootstrap5.git")
sha256sums=(SKIP)

build() {
	cd $_pkg
    python -m build --wheel --no-isolation
    make build/changelog.Debian.gz
    make build/copyright
}

package() {
	cd $_pkg
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 build/changelog.Debian.gz "${pkgdir}"/usr/share/doc/${pkgname}/changelog.Debian.gz
	install -Dm644 build/copyright "${pkgdir}"/usr/share/doc/${pkgname}/copyright
}
