# Contributor: Alexandr Parkhomenko <it@52tour.ru>

_author=ales-erjavec
_pkgname=anyqt
pkgname=python-$_pkgname-git
pkgver=0.0.11
pkgrel=1
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL')
makedepends=('python-setuptools')
depends=('python-pyqt5')
provides=('python-anyqt')
source=("git://github.com/$_author/$_pkgname")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --tags `git rev-list --tags --max-count=1` | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g' #| sed -r "s/0$/$COMMIT/"
}

build() {
  cd "${srcdir}"/$_pkgname
  python setup.py build
}

package() {
  cd "${srcdir}/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
}


