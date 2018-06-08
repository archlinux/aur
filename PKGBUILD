# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.5.12
pkgrel=12
pkgdesc="Text mode RSS newsreader for Linux and Unix."
arch=(x86_64)
#url="http://kiza.kcore.de/software/snownews/"
url="https://github.com/kouya/snownews"
license=('GPL')
depends=('libxml2' 'ncurses' 'perl-xml-libxml' 'perl-xml-libxslt' 'openssl>=1.0')
makedepends=('git')
source=("https://web.archive.org/web/20180608143701/https://kiza.eu/media/software/snownews/snownews-1.5.12.tar.gz"
       "openssl-pkgconfig.patch")
sha256sums=('26dd96e9345d9cbc1c0c9470417080dd0c3eb31e7ea944f78f3302d7060ecb90'
            '847b4bc3139b4a1d0b49c95fe0378cd9d941f3219d8a9510cb2065555276abcc')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -Np0 -i ../openssl-pkgconfig.patch
}
  
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
