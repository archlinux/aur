# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=poezio-omemo-git
_pkgname=poezio-omemo
pkgrel=1
pkgver=r25.29cb0cd
pkgdesc="OMEMO plugin for the Poezio XMPP console client"
arch=('i686' 'x86_64')
url="https://codeberg.org/poezio/poezio-omemo"
conflicts=('poezio-omemo')
provides=('poezio-omemo')
license=('GPL')
depends=(
  'python'
  'poezio-git'
  'python-slixmpp-omemo-git'
  'python-omemo-backend-signal-git'
)
makedepends=(
  'git'
  'python-setuptools'
)

source=("${_pkgname}::git+https://codeberg.org/poezio/poezio-omemo.git")

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
