# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgbase='python-redmine'
pkgname=('python-redmine' 'python2-redmine')
pkgver='2.3.0'
pkgrel='1'
pkgdesc="Python library for communicating with a Redmine project management application"
arch=("any")
url="https://${pkgbase}.com/"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-requests' 'python-coverage')
license=('Apache')
source=("https://github.com/maxtepkeev/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('9c60667b79c1c93a1530d3b299beeb2278b34a33c03ac9bedd99e0d9fc9b0f3b')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  nosetests --with-coverage --cover-erase --cover-package=redminelib
}

package_python-redmine() {
  depends=('python-requests')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-redmine() {
  depends=('python2-requests')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
