# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-qcdiag-git
pkgver=r97.aea8cb8
pkgrel=1
pkgdesc="Osmocom tool for Qualcomm DIAG"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/osmo-qcdiag"
license=('GPL')
depends=('libosmocore' 'libqmi')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gitea.osmocom.org/phone-side/osmo-qcdiag.git")
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
