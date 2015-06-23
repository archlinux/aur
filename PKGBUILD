# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Leonidas <marek@xivilization.net>

pkgname=yap
pkgver=6.2.2
pkgrel=5
pkgdesc='A high-performance Prolog compiler'
url='http://www.dcc.fc.up.pt/~vsc/Yap/'
license=('PerlArtistic')
arch=('i686' 'x86_64')
depends=('gmp' 'unixodbc' 'libmariadbclient')
#makedepends=('texi2html' 'texinfo' 'jdk7-openjdk' 'texlive-plainextra')
#optdepends=('java-runtime-headless: Java Interface Library JPL')
source=("http://www.dcc.fc.up.pt/~vsc/Yap/${pkgname}-${pkgver}.tar.gz"
        "friend-function.patch")
md5sums=('95eaa54978e4811ff6e504e7dca9e835'
         '5b5884a62e8cd9482408565576b872f8')

# issues building java bindings and info pages?
# I leave those up to you to fix, dear reader

# gcc 5 patch
# http://pkgs.fedoraproject.org/cgit/yap.git/plain/yap-6.2.2-Friend-function-template-defined-in-a-class-cannot-b.patch

build() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i ../friend-function.patch

  ./configure \
    --prefix=/usr \
    --enable-threads \
    --enable-dynamic-loading \
    --enable-max-performance \
    --enable-max-memory 
    # --with-java="${JAVA_HOME}"
  make

  #make html
  #make pdf
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  #make DESTDIR="${pkgdir}" install_docs
}
