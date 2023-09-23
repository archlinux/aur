# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=deadbeef-plugin-replaygain-scan-git
pkgver=r15.64400aa
pkgrel=1
pkgdesc="libEBUR128-based ReplayGain scanner plugin for the DeaDBeeF audio player"
arch=(x86_64)
url="https://github.com/Soukyuu/ddb_misc_replaygain_scan"
license=(MIT)
depends=(deadbeef)
makedepends=(git gtk2 gtk3)
provides=(deadbeef-plugin-replaygain-scan)
conflicts=(deadbeef-plugin-replaygain-scan deadbeef-replaygain-scan)
replaces=(deadbeef-replaygain-scan)
source=("deadbeef-plugin-replaygain-scan::git+https://github.com/Soukyuu/ddb_misc_replaygain_scan.git")
sha256sums=('SKIP')

pkgver() {
  cd deadbeef-plugin-replaygain-scan
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd deadbeef-plugin-replaygain-scan
  make
}

package() {
  cd deadbeef-plugin-replaygain-scan
  install -dm755 "$pkgdir/usr/lib/deadbeef"
  cp ddb*.so "$pkgdir/usr/lib/deadbeef"
  install -D COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
