# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.5.13
pkgrel=1
pkgdesc="Text mode RSS newsreader for Linux and Unix."
arch=(x86_64)
#url="http://kiza.kcore.de/software/snownews/"
url="https://github.com/kouya/snownews"
license=('GPL')
depends=('libxml2' 'ncurses' 'perl-xml-libxml' 'perl-xml-libxslt' 'openssl>=1.0')
makedepends=('git')
source=("https://github.com/kouya/snownews/archive/v1.5.13.tar.gz")
       #"openssl-pkgconfig.patch")
sha256sums=('9a06cd58dee7846cbb18166c3b60153c1b7ee963261b205633d77feaa5410455')

#prepare() {
#  cd "$srcdir"/$pkgname-$pkgver
#  patch -Np0 -i ../openssl-pkgconfig.patch
#}
  
build() {
  cd "$srcdir"/$pkgname-$pkgver
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make  DESTDIR="$pkgdir/" install
  ln -fs /usr/bin/opml2snow "$pkgdir"/usr/bin/snow2opml

}
