# Maintainer: Brett Bergstrom <bonkmaykr@canithesis.org>
pkgname=amiwm
pkgver=0.22pl2+github
pkgrel=1
pkgdesc="An X window manager that tries to mimic the Amiga Workbench screen."
arch=('i686' 'x86_64')
url="http://www.lysator.liu.se/~marcus/amiwm.html"
license=('amiwm')
depends=('xorg-xinit')
makedepends=('git' 'autoconf')
source=("make_wm.patch" "make_libami.patch")
sha256sums=('eba44a0091e9744da389739c07ba062f86b7a8df4c6cf9d6cd2020263c6bf544'
            '5e6701b05509344e7413980ed703ab2aecdb07d294177b32e340af2aa270e17b')

build() {
  git clone https://github.com/amiwm/amiwm.git
  cd amiwm
# patch -p1 -i ../destdir.patch
  patch -p0 -i ../make_wm.patch
  patch -p0 -i ../make_libami.patch
  autoconf
  ./configure #--prefix=/usr
  make
}

package() {
  cd amiwm
  make DESTDIR="$pkgdir/" install
}
