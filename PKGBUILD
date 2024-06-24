# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-qcdiag-git
pkgver=r102.5b01f0b
pkgrel=2
pkgdesc="Osmocom tool for Qualcomm DIAG"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/osmo-qcdiag"
license=('GPL-2.0-or-later')
depends=('libosmocore.so' 'libqmi')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gerrit.osmocom.org/osmo-qcdiag.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make -C src
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m 755 src/osmo-qcdiag-log "${pkgdir}/usr/bin/osmo-qcdiag-log"
}
