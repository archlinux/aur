# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=guitar-git
pkgver=1.3.1.r317.ga661d04
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
provides=(guitar)
conflicts=(guitar)
source=("git+https://github.com/soramimi/Guitar.git")
sha256sums=('SKIP')

pkgver() {
  cd "Guitar"
  git describe --long --tags --abbrev=7 --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/Guitar"
  qmake6 Guitar.pro
  make
}

package() {
  cd "Guitar"
  install -Dm755 "_bin/Guitar" "${pkgdir}/usr/bin/guitar"

  cd LinuxDesktop
  install -D Guitar.svg         -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -D guitar.desktop     -t "${pkgdir}/usr/share/applications/"
  install -D guitar.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
}
