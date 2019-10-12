# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=clang+llvm-binaries
pkgver=9.0.0
_name="clang+llvm-${pkgver}-${CARCH}-pc-linux-gnu"
pkgrel=1
pkgdesc='Clang and LLVM Pre-Built Binaries'
arch=('x86_64')
url='http://llvm.org/'
license=('custom:University of Illinois/NCSA Open Source License')
options=('!strip' 'libtool' 'staticlibs')
# conflicts=('clang' 'clang-analyze' 'clang-tools-extra' 'llvm')
depends=('z3')
install="${pkgname}".install
source=("${url}/releases/${pkgver}/${_name}.tar.xz"
        "clang+llvm-binaries.conf")
sha256sums=('616c5f75418c88a72613b6d0a93178028f81357777226869ea6b34c23d08a12d'
            'f283a326962a77447bcb562fe2c4a81ca556ae2ffaacc35375207fd378574ccd')

prepare() {
  cd "${srcdir}/${_name}"
  sed -i 's|/usr/bin/env python|&2|' bin/{git-clang-format,scan-view}
}

package() {
  mkdir -p "${pkgdir}/etc/ld.so.conf.d/"
  cp clang+llvm-binaries.conf "${pkgdir}/etc/ld.so.conf.d/"

  cd "${srcdir}/${_name}"

  mkdir -p "${pkgdir}/usr/local"
  mv * "${pkgdir}/usr/local"
  mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/local/man"
}

# vim:set ts=2 sw=2 h et:
