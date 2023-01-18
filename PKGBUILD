# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgbase='python-redmine'
pkgname="${pkgbase}"
pkgver='2.4.0'
pkgrel='1'
pkgdesc="Python library for communicating with a Redmine project management application"
arch=("any")
url="https://${pkgbase}.com"
depends=('python-requests')
makedepends=('python' 'python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-requests' 'python-coverage')
license=('Apache')
source=("https://github.com/maxtepkeev/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('746c6e0e165e21e9dea6c6e563064f3a27e38234dfe827f4a2215b89b8c11860')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  nosetests --with-coverage --cover-erase --cover-package=redminelib
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O2 --root="${pkgdir}"
}
