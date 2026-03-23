# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jakka <jakkadoujin at gmail dot com>
# Maintainer: eaglet <0dsun4ppj at mozmail dot com>

pkgname=apngasm
pkgver=3.1.10
pkgrel=2
pkgdesc="tool for assembling apng files"
arch=('i686' 'x86_64')
url="https://github.com/apngasm/apngasm"
license=('LGPL')
conflicts=('apng-utils' 'apngasm-bin')
depends=('libpng' 'boost-libs' 'glibc' 'libstdc++' 'libgcc' 'zlib')
makedepends=('cmake' 'boost' 'git')
source=("https://github.com/apngasm/apngasm/archive/${pkgver}.tar.gz" "apngasm.patch")
sha512sums=('670d75251ddc771f9b2b4a1f401066f2012a6814bec781b918f1d9e8960835654c66c3d19b4c8920d5186d85af12cdc4bba8b61c8f3d349b4fc70513d8ecb34e'
            '6e024de6837be964e005bf58d903e739d400b7b0696749890db2de141b8404a143e2b3af79a52e2a98249917e6e3dc9c4a621e0d0e53ce2e5b20d029246355a4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../apngasm.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}"/usr/man/man1/apngasm.1 "${pkgdir}"/usr/share/man/man1/apngasm.1
  rm -r "${pkgdir}"/usr/man
}
