# Maintainer: jkl
# Contributor: Kyler Eastridge

pkgname=quickbms
pkgver=0.12.0
pkgrel=1
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
            '96d64f47b68fccc9eeacb12619dc0ac66e7dcf5caa5431db6daef3b618a09c75311edc763e3e1676fc21568eb770372609eaf921d68fe781bbdd78ede0aac341')

prepare() {
  cd src
  patch -Np1 < ../0001-Fix-OpenSSL-V21-padding-deprecation.patch
  patch -Np1 < ../0002-fix-compile-x86.patch
}

build() {
  cd src
  make
}

package() {
  cd src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
