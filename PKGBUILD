# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=hftirc-git
pkgver=0.231.cc986f7
pkgrel=1
pkgdesc="Ncurses IRC client."
arch=('i686' 'x86_64')
url="http://github.com/xorg62/HFTIrc/"
license=('BSD')
depends=('ncurses')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/xorg62/HFTIrc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$pkgname"
  # LDFLAGS to remove harmful -Wl Flag
  export LDFLAGS="${LDFLAGS//-Wl,}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
} 

