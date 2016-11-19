# Maintainer: Doug Newgard <trollsid at gmail dot com>

_pkgname=egitu
pkgname=$_pkgname
pkgver=r256.c92699b
pkgrel=1
pkgdesc="EFL Git user interface"
url="http://www.enlightenment.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('efl' 'git' 'python' 'python-efl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/DaveMDS/egitu.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}


build() {
  cd "$_pkgname"
  ./setup.py build
}

package() {
    cd  "${srcdir}/${pkgname}"
    ./setup.py install --prefix "${pkgdir}/usr"
}

