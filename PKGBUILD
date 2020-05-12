# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=clang+llvm-binaries
pkgver=10.0.0
_name="clang+llvm-${pkgver}-${CARCH}-linux-gnu-ubuntu-18.04"
pkgrel=1
pkgdesc='Clang and LLVM Pre-Built Binaries'
arch=('x86_64')
url='http://llvm.org'
license=('custom:University of Illinois/NCSA Open Source License')
options=('!strip' 'libtool' 'staticlibs')
# conflicts=('clang' 'clang-analyze' 'clang-tools-extra' 'llvm')
depends=('z3')
install="${pkgname}".install
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/${_name}.tar.xz"
        "clang+llvm-binaries.conf")
sha256sums=('b25f592a0c00686f03e3b7db68ca6dc87418f681f4ead4df4745a01d9be63843'
            'f283a326962a77447bcb562fe2c4a81ca556ae2ffaacc35375207fd378574ccd')

package() {
  mkdir -p "${pkgdir}/etc/ld.so.conf.d/"
  cp clang+llvm-binaries.conf "${pkgdir}/etc/ld.so.conf.d/"

  cd "${srcdir}/${_name}"

  mkdir -p "${pkgdir}/usr/local"
  mv * "${pkgdir}/usr/local"
  mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/local/man"
}

# vim:set ts=2 sw=2 h et:
