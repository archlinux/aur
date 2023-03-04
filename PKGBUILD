# Maintainer: Mahmut Dikcizgi <boogiepop a~t gmx com>

pkgname=dri2to3-git
pkgver=r6.43a51c6
pkgrel=1
pkgdesc='Library implementing DRI2 on top of DRI3 for running blob X11 drivers under Xwayland.'
arch=('aarch64' 'arm7h')
url='https://gitlab.com/panfork/dri2to3'
license=('MIT')
depends=('gcc-libs' 'coreutils' 'mesa')
makedepends=('meson' 'ninja')
options=(!lto debug strip)
source=(git+https://gitlab.com/panfork/dri2to3.git#branch=main)
sha256sums=('SKIP')

build() {
	cd dri2to3
	mkdir -p build
	cd build
	meson setup --prefix="$pkgdir/usr"
	ninja
}

pkgver() {
  cd dri2to3
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  	provides=(dri2to3 $pkgname)
  	conflicts=(dri2to3 $pkgname)
  	cd dri2to3/build
    ninja install
}
