# Maintainer: jkl
# Contributor: Kyler Eastridge

pkgname=quickbms
pkgver=0.12.0
pkgrel=2
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("https://aluigi.altervista.org/papers/quickbms-src-$pkgver.zip"
        "0001-Fix-OpenSSL-V21-padding-deprecation.patch"
        "0002-fix-compile-x86.patch")
sha512sums=('dc42fa71743f00222f5062c38906d33c888713bc2daf68ea63223f3346370bc100093e6f9c7bfe5fd0c4ea9024b7b336f3ae54ec95204fdaf891f5c9734419e3'
            '4c5915da99174888deb812f292c18f82b055cef74610d5bc8321360f5cb530a6327df532b97c0255f9cebcbaf7809d4bcd144361d4ef64d860a1bca9439990f0'
            'b863e1bf17f60f1a182a74b251d070dcfec594534688320e7a99170ef4ece358685b3acf74511cf003a7dce4c8035cbbf71826951c4301edec4d7d7faed578f7')

prepare() {
  cd src
  patch -Np1 < ../0001-Fix-OpenSSL-V21-padding-deprecation.patch
  patch -Np1 < ../0002-fix-compile-x86.patch
}

build() {
  cd src
  [[ (-z "$CC" || "$CC" = "gcc") && (-z "$CXX" || "$CXX" = "g++") ]] \
    || echo "${YELLOW}==> WARNING:${ALL_OFF}${BOLD} Only gcc is supported. Forcing gcc.${ALL_OFF}" >&2
  CC=gcc CXX=g++ make
}

package() {
  cd src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
