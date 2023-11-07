_pkgbase=netevent
pkgname=netevent-git
pkgver=2.2.2.r0.gbcadfcc
pkgrel=1
pkgdesc="Event device viewing/cloning utility"
url="https://github.com/Blub/netevent"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=()
makedepends=('python-docutils' 'git')
source=("git+https://github.com/Blub/netevent.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/netevent"
  git describe --long --tags  | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/$_pkgbase"
  CXX=g++ ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_pkgbase"
  sed -i 's/-Werror//' ./Makefile
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR="$pkgdir" install
}

