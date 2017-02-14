# Maintainer: Jan Tojnar <jtojnar@gmail.com>
_pkgname='hamster-gtk'
pkgname='python-hamster-gtk'
pkgver='0.11.0'
pkgrel=1
pkgdesc="[In heavy development] A GTK interface to the hamster time tracker."
url="https://github.com/projecthamster/hamster-gtk"
depends=('gtk3' 'python' 'python-gobject' 'python-hamster-lib')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://github.com/projecthamster/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('57697da24e8f43cd440b16f8e111c7319e567c8ea9c8cca235d09b3e4f3bc862')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find hamster_gtk -type f -exec sed -i 's/backports\.//g' {} +
	sed "s/find_packages()/find_packages(exclude=['tests'])/" -i setup.py
	python setup.py install --root="${pkgdir}" --optimize=1
}
