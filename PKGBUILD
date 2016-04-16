# Maintainer: liushuyu

_pkgname=libvsq
pkgname=libvsq-git
pkgver=r386.6e259d9
pkgrel=1
pkgdesc='A C++ library for reading/writing/editing VSQ file for VOCALOID2 and VOCALOID1'
url='https://github.com/kbinani/libvsq'
arch=('i686' 'x86_64')
license=('BSD')
#depends=('')
makedepends=('git' 'cmake')
options=('!strip')
provides=('libvsq')
source=('git+https://github.com/kbinani/libvsq.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd -- "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make #-j1
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/include/libvsq"
  install -m644 ${srcdir}/${_pkgname}/include/libvsq/* "${pkgdir}/usr/include/libvsq/"
  install -Dm644 "${srcdir}/${_pkgname}/lib/libvsq.a" "${pkgdir}/usr/lib/libvsq.a"
}

# vim:set ts=2 sw=2 et:
