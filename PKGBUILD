# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libidn2-nodocs-git
pkgver=2.0.4.r20.g45b56ae
pkgrel=1
pkgdesc="An implementation of IDNA 2008 and TR46"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libidn/#libidn2"
license=('GPL' 'LGPL')
depends=('glibc' 'libunistring')
makedepends=('git' 'gengetopt' 'rsync' 'wget' 'ruby-ronn')
provides=('libidn2')
conflicts=('libidn2')
options=('staticlibs')
source=("git+https://gitlab.com/libidn/libidn2.git")
sha256sums=('SKIP')


pkgver() {
  cd "libidn2"

  git describe --long --tags | sed 's/^libidn2.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libidn2"

  ./bootstrap
  ./configure --prefix="/usr" --disable-doc
  make
}

#check() {
#  cd "libidn2"

#  make check
#}

package() {
  cd "libidn2"

  make DESTDIR="$pkgdir" install
}
