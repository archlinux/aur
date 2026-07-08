# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>
# Contributor: liberodark

pkgname=guitar
pkgver=1.4.0
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=(x86_64 i686 armv7h aarch64)
url="https://soramimi.github.io/Guitar/"
license=(GPL-2.0-only)
depends=(
    git
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    openssl
    qt6-base
    qt6-svg
    zlib
    )
makedepends=(
    qt6-tools
    ruby
    )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/soramimi/Guitar/archive/v${pkgver}.tar.gz")
sha256sums=('baa1b098ce90f91b8862c6d266aa2c2db344e74785a29308f3379a6535123449')

build() {
  cd "Guitar-${pkgver}/filetype"
  ./build-gcc.sh

  cd "${srcdir}/Guitar-${pkgver}"
  qmake6 Guitar.pro
  make
}

package() {
  cd "Guitar-${pkgver}"
  install -Dm755 "_bin/Guitar" "${pkgdir}/usr/bin/guitar"

  cd LinuxDesktop
  install -D Guitar.svg         -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -D guitar.desktop     -t "${pkgdir}/usr/share/applications/"
  install -D guitar.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
}
