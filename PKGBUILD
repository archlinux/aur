# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=net6
pkgver=1.3.14
pkgrel=5
pkgdesc="A library that provides a TCP protocol abstraction for C++"
arch=('x86_64')
url="http://gobby.0x539.de/"
license=('LGPL')
depends=('gnutls' 'libsigc++2.0')
validpgpkeys=('17107DB19A2842FFB6997654ED1A3933B2CFCDD8')
source=(http://releases.0x539.de/$pkgname/$pkgname-$pkgver.tar.gz{,.sig}
	gnutls.patch)
sha256sums=('155dd82cbe1f8354205c79ab2bb54af4957047422250482596a34b0e0cc61e21'
            'SKIP'
            '800330f06223d29557a92c9d1d4c7184e3881e595e6db506c4b28b162473cd68')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/gnutls.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # libsigc++ 2.6.0 (and later) uses C++11 features
  CXXFLAGS+=' -std=c++11'

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
