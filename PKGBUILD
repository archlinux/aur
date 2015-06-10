# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcaenc-git
pkgver=44.68ed0d6
pkgrel=1
pkgdesc="A Free Software (LGPL-licensed) encoder for the DTS Coherent Acoustics audio format."
arch=(x86_64 i686)
url="http://aepatrakov.narod.ru/dcaenc/"
license=(LGPL)
depends=(alsa-lib)
makedepends=(git autoconf)
provides=(dcaenc)
conflicts=(dcaenc)
options=(!libtool)
source=("git+https://gitlab.com/patrakov/dcaenc.git")
sha512sums=('SKIP')

pkgver() {
  cd dcaenc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd dcaenc

  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

check() {
  cd dcaenc
  make -k check
}

package() {
  cd dcaenc
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
