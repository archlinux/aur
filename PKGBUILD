# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Dominic Brekau <aur@dominic.brekau.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ucommon
pkgver=7.0.0
pkgrel=3
pkgdesc='GNU Common C++ is a class framework that was specifically designed for telephony applications.'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/commoncpp/'
license=('LGPL3')
depends=('gnutls')
source=("https://ftp.gnu.org/gnu/commoncpp/$pkgname-$pkgver.tar.gz")
sha256sums=('6ac9f76c2af010f97e916e4bae1cece341dc64ca28e3881ff4ddc3bc334060d7')

build() {
  cd ${pkgname}-${pkgver}
  CXXFLAGS+=" -std=c++14"
  ./configure --prefix=/usr --with-sslstack=gnu --enable-socks --enable-stdcpp --enable-atomics --with-pkg-config
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
