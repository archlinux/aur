# Maintainer: William Sutton <will at sutton-family dot org>

pkgname=mtx-git
_pkgname=mtx
pkgver=r8.3dc2a38
pkgrel=3
pkgdesc="Tools used to view information about, and to control, Media Changer devices such as Tape and DVD/CD libraries."
arch=('i686' 'x86_64')
url="https://github.com/mtx-org/mtx"
license=('GPL2')
provides=('mtx')
conflicts=('mtx')
makedepends=('git')
source=(git+https://github.com/mtx-org/mtx.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/mtx"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_CARCH=$CARCH
[[ $CARCH = i?86 ]] && _CARCH=i686

build() {
  cd "${srcdir}/${_pkgname}/mtx"
  ./configure --prefix=/usr --build=${_CARCH}-unknown-linux-gnu
  make
}

package() {
  cd "${srcdir}/${_pkgname}/mtx"
  make prefix="$pkgdir/usr" sbindir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man" install
}

