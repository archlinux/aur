# Maintainer: Andrew Shark <ashark linuxcomp ru>
# Contributor: Ben Isenhart <bisenhar(at)uvm(dot)edu>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Wang Jiajun <amesists@gmail.com>

pkgname=kdesrc-build-git
pkgver=22.07.r573.g9f8c5e2
pkgrel=1
pkgdesc="A script to build KDE software from KDE's source repositories"
url="https://apps.kde.org/kdesrc_build"
arch=("any")
license=("GPL")
depends=("perl-json" "perl-json-xs" "perl-yaml-libyaml" "perl-io-socket-ssl" "perl-libwww" "perl-xml-parser")
makedepends=("cmake" "git")
source=("git+https://invent.kde.org/sdk/kdesrc-build.git")
sha256sums=("SKIP")

pkgver() {
  cd kdesrc-build
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -S kdesrc-build \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  mkdir "${pkgdir}/usr/bin"
  ln -sfv "${pkgdir}/usr/share/kdesrc-build/kdesrc-build" "${pkgdir}/usr/bin/kdesrc-build"
  ln -sfv "${pkgdir}/usr/share/kdesrc-build/kdesrc-run" "${pkgdir}/usr/bin/kdesrc-run"
}
