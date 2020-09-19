# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Original Maintainer: Luca P <meti at lplab.net>

pkgname=hss
pkgver=1.8
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc="Interactive ssh client for multiple servers."
url="https://github.com/six-ddc/hss"
license=('GPL')
depends=(readline)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/six-ddc/hss/archive/v${pkgver}.tar.gz"
    "cppflags.patch::https://github.com/six-ddc/hss/commit/70b8e897a750856e1aa2d747f29fb94d085dfe26.patch"
)
sha256sums=('60481274403c551f5b717599c813d619877a009832c4a8a84fcead18e39382fa'
            '0175c430d05faf8a09b02c6192496bcf71f3b2d0f2152ded8472ac5f7a5fb239')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i ../cppflags.patch

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALL_BIN="${pkgdir}/usr/bin" install
}
