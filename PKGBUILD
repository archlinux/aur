# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-django-html-utils
_pkg="${pkgname#python-}"
pkgver=0.2.2
pkgrel=1
pkgdesc="HTML utils app for django."
url="https://github.com/jnphilipp/django-html-utils"
depends=('python-django')
makedepends=('python-build' 'python-installer')
license=('GPL3+')
arch=(any)
source=("git+https://github.com/jnphilipp/django-html-utils.git")
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
