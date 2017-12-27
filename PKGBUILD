# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=clang+llvm-binaries
pkgver=5.0.1
_name="clang+llvm-${pkgver}-x86_64-linux-gnu-Fedora27"
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
sha256sums=('6c9c81cdcac89d179e0b03810c37370db6d033ccbb6b5e9d864af573f58f7890'
            'SKIP'
            'f283a326962a77447bcb562fe2c4a81ca556ae2ffaacc35375207fd378574ccd')
validpgpkeys=('11E521D646982372EB577A1F8F0871F202119294') # Tom Stellard <tom@stellard.net>

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

# vim:set ts=2 sw=2 ft=sh et:
