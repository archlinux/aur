# Maintainer: libele <libele@disroot.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: xaw <xawl.ch@gmail.com>

pkgname=cwm
pkgver=7.1
pkgrel=2
pkgdesc="Fork of calmwm, a clean and lightweight window manager"
arch=('aarch64' 'x86_64')
url="https://github.com/leahneukirchen/cwm"
license=('BSD')
depends=('libxft' 'libxrandr')
changelog=cwm.changelog
source=("https://leahneukirchen.org/releases/cwm-${pkgver}.tar.gz"{,.asc}
	'cwm.desktop')
sha256sums=('4a58c5cb4312d8d0f03ba657d7656c12d8d7c1277aeb1c05272984501597bd90'
	    'SKIP'
	    'SKIP')
validpgpkeys=('E6F6848A1B95EE313CF5B7EE95FF633C90A8F025') # Leah Neukirchen <leah@vuxu.org>

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "${srcdir}/cwm.desktop" "${pkgdir}/usr/share/xsessions/cwm.desktop"
  install -Dm644 <(sed -n '/Copyright/,/PERFORMANCE/p' <calmwm.c) "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
