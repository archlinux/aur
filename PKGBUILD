# Maintainer: Carlo Capocasa <carlo@capocasa.net>
pkgname=jamrouter-git
pkgver=r46.23527ae
pkgrel=1
epoch=
pkgdesc="A low-latency low-jitter ALSA MIDI to Jack MIDI bridge, hardware MIDI compatibility layer and event processor"
arch=(x86_64)
url="https://github.com/williamweston/jamrouter.git"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"$pkgname::git+https://github.com/williamweston/jamrouter.git#branch=master"
)
noextract=()
md5sums=(
"SKIP"
)
validpgpkeys=()

prepare() {
	cd "$pkgname"
  aclocal &> /dev/null
  autoconf &> /dev/null
	automake &> /dev/null
	autoheader &> /dev/null
  ./configure --enable-arch=native
}

build() {
	cd "$pkgname"
  make
}

check() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

