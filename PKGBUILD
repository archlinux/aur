# Maintainer: Wang Jiajun <amesists AT gmail DOT com>
pkgname=python2-goobook
_pkgname=goobook
pkgver=1.9
pkgrel=1
pkgdesc="Search your google contacts from the command-line or mutt."
url="https://gitlab.com/goobook/goobook"
arch=('any')
license=('GPLv3')
depends=('python2' 'python2-gdata' 'python2-simplejson' 'python2-keyring')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('41f2246336ea713591e7d912d9d05193')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  sed -ie '58s/distribute/setuptools/' setup.py || return 1
  python2 setup.py build || return 1
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  python2 setup.py install --root=$pkgdir || return 1
}
