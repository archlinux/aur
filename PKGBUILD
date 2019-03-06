# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Leonidas <marek@xivilization.net>

pkgname=yap
pkgver=6.3.3
pkgrel=1
pkgdesc='A high-performance Prolog compiler'
url='http://www.dcc.fc.up.pt/~vsc/yap/'
license=('PerlArtistic')
arch=('i686' 'x86_64')
depends=('gmp' 'unixodbc' 'libmariadbclient')
#makedepends=('texi2html' 'texinfo' 'jdk7-openjdk' 'texlive-plainextra')
#optdepends=('java-runtime-headless: Java Interface Library JPL')
#source=("http://www.dcc.fc.up.pt/~vsc/yap/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/vscosta/yap-6.3/archive/yap-$pkgver.tar.gz")
md5sums=('6d9d2e5617f53b077c8f7da0ada2731b')

# issues building java bindings and info pages?
# I leave those up to you to fix, dear reader

build() {
  cd "yap-6.3-yap-$pkgver"

  #patch -p1 -i ../friend-function.patch

  export CPPFLAGS+=" -fpermissive"
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
  cd "yap-6.3-yap-$pkgver"

  make DESTDIR="${pkgdir}" install
  #make DESTDIR="${pkgdir}" install_docs
}
