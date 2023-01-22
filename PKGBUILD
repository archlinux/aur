# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: xaw <xawl.ch@gmail.com>

pkgname=cwm
pkgver=7.1
pkgrel=1
pkgdesc="Fork of calmwm, a clean and lightweight window manager"
arch=('x86_64')
url="https://github.com/leahneukirchen/cwm"
license=('BSD')
depends=('libxft' 'libxrandr')
changelog=cwm.changelog
makedepends=('git')
source=("$pkgname::git+https://github.com/chneukirchen/cwm.git#tag=v${pkgver}" 'cwm.desktop')
sha256sums=('SKIP'
            '8dc947993fbf294d6f41ba2e0d4234b2321c536a75be1395f6a772cd4aa3f379')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "${srcdir}/cwm.desktop" "${pkgdir}/usr/share/xsessions/cwm.desktop"
  install -Dm644 <(sed -n '/Copyright/,/PERFORMANCE/p' <calmwm.c) "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
