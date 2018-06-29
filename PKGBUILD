# Maintainer: Milk Brewster <milk on freenode>
_pkgname=calfbox
pkgname=${_pkgname}-git
pkgver=r1307.ef8ea8d
pkgrel=1
pkgdesc="Open source musical instrument"
arch=(x86_64)
url="https://github.com/kfoltman/calfbox"
license=('GPL')
groups=()
depends=('fluidsynth' 'libsndfile' 'ncurses' 'libsmf' 'jack' 'python3')
makedepends=('git')
provides=('calfbox' 'calfbox-git')
conflicts=('calfbox' 'calfbox-git')
install=
source=('git+https://github.com/kfoltman/calfbox')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/calfbox"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/calfbox"
  ./autogen.sh
  ./configure
}

build() {
  cd "$srcdir/calfbox"
	python3 setup.py build
}

package() {
  cd "$srcdir/calfbox"
  python3 setup.py install --root $pkgdir
}
