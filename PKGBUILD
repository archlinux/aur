# Maintainer: Milk Brewster <milk on freenode>
_pkgname=patroneo
pkgname=${_pkgname}-git
pkgver=v1.0.r12.g7166932
pkgrel=1
pkgdesc="Easy Pattern Sequencer - Utilizing Jack Midi and the Non Session Manager"
arch=(x86_64)
url="https://github.com/diovudau/Patroneo"
license=('GPL')
groups=()
depends=('python' 'python-pyqt5')
makedepends=('git' 'nuitka')
optdepends=('non-session-manager: required to run Patroneo'
            'raysession-git: alternative to non-session-manager')
provides=('patroneo' 'patroneo-git')
conflicts=('patroneo' 'patroneo-git')
install=
source=('git+https://github.com/diovudau/patroneo')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/patroneo"

  # Git, no tags available
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/patroneo"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/patroneo"
  make
}

package() {
  cd "$srcdir/patroneo"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
