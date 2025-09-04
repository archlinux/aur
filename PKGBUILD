# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sgp4'
_name="${pkgname#python-}"
pkgver='2.25'
pkgrel=1
pkgdesc="Track earth satellite TLE orbits using up-to-date 2010 version of SGP4"
url="https://pypi.org/project/sgp4/"
depends=('gcc-libs' 'glibc' 'python' 'python-numpy')
makedepends=('python-build' 'python-installer')
license=('MIT')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e19edc6dcc25d69fb8fde0a267b8f0c44d7e915c7bcbeacf5d3a8b595baf0674')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "${srcdir}/${_name}-${pkgver}"
#	python sgp4/tests.py
#}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
