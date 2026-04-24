#!/usr/bin/env bash
# AUR package script for MayaFlux
# Maintainer: Ranjith Hegde <mayafluxcollective@proton.me>

pkgname=tinyexr-git
_pkgname=tinyexr
pkgver=r693.4946b5d
pkgrel=1
pkgdesc="Tiny OpenEXR image library (single-header C++ alternative to OpenEXR)"
arch=('any')
url="https://github.com/syoyo/tinyexr"
license=('BSD3')
depends=()
makedepends=('git')
provides=('tinyexr')
conflicts=('tinyexr')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 tinyexr.h "${pkgdir}/usr/include/tinyexr.h"
  install -Dm644 exr_reader.hh "${pkgdir}/usr/include/exr_reader.hh"
  install -Dm644 streamreader.hh "${pkgdir}/usr/include/streamreader.hh"
  install -Dm644 deps/miniz/miniz.h "${pkgdir}/usr/include/miniz.h"
  install -Dm644 deps/miniz/miniz.c "${pkgdir}/usr/include/miniz.c"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/lib/pkgconfig"
  cat > "${pkgdir}/usr/lib/pkgconfig/tinyexr.pc" <<EOF
prefix=/usr
exec_prefix=\${prefix}
includedir=\${prefix}/include

Name: tinyexr
Description: Tiny OpenEXR image loader/saver library
Version: ${pkgver}
Cflags: -I\${includedir}
EOF
}
