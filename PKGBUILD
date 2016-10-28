# Maintainer: Dylan Baker <dylan@pnwbakers.com>
_pkgname=xtsttopng
pkgname=${_pkgname}-git
pkgver=r6.e3daf14
pkgrel=1
pkgdesc="Tool to convert X Test Suite results into PNG images"
arch=("i686" "x86_64")
url="https://cgit.freedesktop.org/xorg/app/xtsttopng/"
license=('GPL2')
depends=('libpng')
makedepends=('git' 'xorg-util-macros')
source=("git+https://anongit.freedesktop.org/git/xorg/app/xtsttopng.git")
md5sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
