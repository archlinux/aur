# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=poezio-omemo-git
_pkgname=poezio-omemo
pkgrel=1
pkgver=r5.05310c1
pkgdesc="OMEMO plugin for the Poezio XMPP console client"
arch=('i686' 'x86_64')
url="https://lab.louiz.org/poezio/poezio-omemo"
conflicts=('poezio-omemo')
provides=('poezio-omemo')
license=('GPL')
depends=(
  'python'
  'python-setuptools'
  'poezio-git'
  'python-slixmpp-omemo-git'
  'python-omemo-backend-signal-git'
)
makedepends=('git')

source=("${_pkgname}::git+https://lab.louiz.org/poezio/poezio-omemo.git")

pkgver() {
  cd ${_pkgname}
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

sha256sums=('SKIP')
