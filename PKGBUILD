# Maintainer: Giacomo Vercesi <1vercesig@gmail.com>

pkgname=superblt-git
pkgver=r506.10dfbdc
pkgrel=1
pkgdesc="Mod loader for Payday 2 (non-Steam runtime only)"
arch=('i686' 'x86_64')
url="https://gitlab.com/znixian/payday2-superblt"
license=('GPL3')
groups=()
depends=('curl' 'openal')
makedepends=('git' 'cmake')
provides=()
conflicts=("superblt")
replaces=()
backup=()
options=()
install=superblt.install
source=("superblt::git+https://gitlab.com/znixian/payday2-superblt.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}" || exit
  # Git, tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/superblt" || exit
	git submodule update --init
}

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build" || exit
	cmake "$srcdir/superblt"
	make
}

package() {
	install -D -m644 "${srcdir}/build/libsuperblt_loader.so" "${pkgdir}/usr/lib/superblt/libsuperblt_loader.so"
}
