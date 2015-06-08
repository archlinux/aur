# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

_pkgname=ktsuss
pkgname=ktsuss-git
pkgver=0.r19.e1358de
pkgrel=1
pkgdesc="Graphical version of su written in C and GTK+"
arch=('i686' 'x86_64')
url="https://github.com/nomius/ktsuss"
license=('BSD')
depends=('util-linux' 'gtk2')
makedepends=('git')
provides=('ktsuss')
conflicts=('ktsuss')
source=("$_pkgname"::'git+https://github.com/nomius/ktsuss.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  if [ ! -x ./configure ]; then
    ./autogen.sh
  fi

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/"${_pkgname}"/COPYING
}
