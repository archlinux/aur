# Maintainer: William J. Bowman <bluephoenix47@gmail.com>

# via Contributer pmates: 
# For users having problems installing this, I recommend rebuilding several of the dependencies using the following modifications:
# - when building camlp5-transitional add "options=('staticlibs')" to the PKGBUILD file
# - when building coq edit the PKGBUILD file to use the 'usecamlp5' flag instead of 'usecamlp4'
# - when building ssreflect modify the download location, as mentioned by daoo, and if you have coq 8.4pl4-1 you will have to remove the coq>=8.4 dependency since makepkg gets confused. 

pkgname=ssreflect
pkgver=1.5
pkgrel=1
pkgdesc="A set of extensions to the scripting language of Coq."
url="http://ssr.msr-inria.inria.fr/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq<8.5') # 'coq>=8.4'
makedepends=('camlp5-transitional>=6.12')
source=(http://ssr.msr-inria.inria.fr/FTP/ssreflect-1.5.tar.gz)
sha256sums=('bad978693d1bfd0a89586a34678bcc244e3b7efba6431e0f83d8e1ae8f82a142')
sha512sums=('4d2ece36609ecc38796568e13d3fe093eefa1bd0bd0c062788ef10c639bccba37bc40023098ea609f5877a1afcbc08c346e1a69640203cd95a9e75709816642f')

build() {
  cd $srcdir/$pkgname-$pkgver

  # SSReflect requires *a lot* of memory to build. It can be a good
  # idea add -j1 to the following command to force a sequential build.
  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}

