# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Kevin Klement = klement at philos dot umass dot edu
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rtf2latex2e
pkgver=2.2.3
dashedver=${pkgver//./-}
pkgrel=2
pkgdesc="Tool to convert rich text format (RTF) documents to LaTeX 2e format."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rtf2latex2e/"
depends=('glibc')
license=('GPL')
optdepends=('texlive-core: To make use of LaTeX output files'
	    'unoconv: to convert EMF, WMF and PICT images to PDF')

source=(http://downloads.sourceforge.net/$pkgname/files/$pkgname-$dashedver.tar.gz)
sha256sums=('7ef86edea11d5513cd86789257a91265fc82d978541d38ab2c08d3e9d6fcd3c3')

prepare() {
  cd $pkgname-$dashedver
  sed -i 's/prefix?=\/usr\/local/prefix?=\/usr/g' Makefile
  sed -i 's+ChangeLog+Changelog+g' Makefile
}

build() {
  cd $pkgname-$dashedver
  CFLAGS+=" -fcommon" make
}

check() {
  cd $pkgname-$dashedver
  CFLAGS+=" -fcommon" make test
}

package() {
  cd $pkgname-$dashedver
  make DESTDIR="$pkgdir" install
}
