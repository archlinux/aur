# Maintainer: libele <libele@disroot.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: xaw <xawl.ch@gmail.com>

pkgname=cwm
pkgver=7.9
pkgrel=1
pkgdesc="Fork of calmwm, a clean and lightweight window manager"
arch=('aarch64' 'x86_64')
url="https://github.com/leahneukirchen/cwm"
license=('BSD')
depends=('libxft' 'libxrandr')
changelog=cwm.changelog
source=("https://leahneukirchen.org/releases/cwm-${pkgver}.tar.gz"{,.asc}
	'cwm.desktop')
sha256sums=('ec75056a5f57980d9f57076c4ae7d25a1e6903ea4e793c0a04b98e25edb0fc90'
            'SKIP'
            '8dc947993fbf294d6f41ba2e0d4234b2321c536a75be1395f6a772cd4aa3f379')
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
