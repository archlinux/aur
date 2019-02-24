# Maintainer: Tim Liou <wheatdoge+arch@gmail.com>

_pkgname="emacs-w3m"
pkgname="${_pkgname}-git"
pkgver=r5665.0c956f82
pkgrel=1
pkgdesc="w3m browser for Emacs (cvs)"
arch=('any')
url="http://emacs-w3m.namazu.org/"
license=('GPL')
source=('git+https://github.com/emacs-w3m/emacs-w3m')
sha256sums=('SKIP')
depends=('emacs' 'w3m')
makedepends=('git' 'autoconf')
provides=('emacs-w3m')
conflicts=('emacs-w3m')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
