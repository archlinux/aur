# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=clang+llvm-binaries
pkgver=3.8.0
_name="clang+llvm-${pkgver}-x86_64-opensuse13.2"
pkgrel=1
pkgdesc='Clang and LLVM Pre-Built Binaries'
arch=('x86_64')
url='http://llvm.org/'
license=('custom:University of Illinois/NCSA Open Source License')
options=('!strip' 'libtool' 'staticlibs')
# conflicts=('clang' 'clang-analyze' 'clang-tools-extra' 'llvm')
install="${pkgname}".install
source=("${url}/releases/${pkgver}/${_name}.tar.xz"
        "${url}/releases/${pkgver}/${_name}.tar.xz.sig"
        "clang+llvm-binaries.conf")
sha256sums=('b4b20a35232595b12f90788b9ca42c4bf559e81013bf26f043ee3b88ea02c9ac'
            'SKIP'
            'f283a326962a77447bcb562fe2c4a81ca556ae2ffaacc35375207fd378574ccd')
validpgpkeys=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D')

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
}

# vim:set ts=2 sw=2 ft=sh et:
