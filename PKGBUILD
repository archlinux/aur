# Maintainer: Jan Tojnar <jtojnar@gmail.com>
_pkgname='hamster-lib'
pkgname="python-${_pkgname}"
pkgver='0.12.0'
pkgrel=1
pkgdesc="A library for common timetracking functionality."
url="https://github.com/projecthamster/hamster-lib"
depends=('python' 'python-appdirs' 'python-future' 'python-icalendar' 'python-sqlalchemy' 'python-six')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://github.com/projecthamster/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ca5f39508196f89731f8ff317a63cf414c4236283d5d181c1cf21351648d930e')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find hamster_lib -type f -exec sed -i 's/backports\.//g' {} +
	sed 's/find_packages()/find_packages(exclude=["tests"])/;s/.*configparser.*//g' -i setup.py
	python setup.py install --root="${pkgdir}" --optimize=1
}
