# Maintainer: nem <nem at posteo dot net>
# Submitter: ClemensFMN

pkgname=qucs-git
pkgver=0.0.18.r772.g43a668c
pkgrel=1
pkgdesc="An integrated circuit simulator with a graphical user interface. (qt4 git version)"
arch=('x86_64' 'i686')
url="http://github.com/qucs/qucs"
license=('GPL')
options=(!makeflags)
depends=('qt4' 'adms-git')
makedepends=('git' 'autoconf' 'automake' 'perl-gd' 'perl-xml-libxml' 'gperf' 'libtool' 'flex' 'bison')
optdepends=('freehdl: to permit digital circuit simulation'
            'asco: to enable circuit optimization')
source=(git+https://github.com/qucs/qucs)
md5sums=('SKIP')

pkgver() {
  cd qucs
  git describe --long | sed -r 's/^qucs-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/qucs/qucs
  ./autogen.sh
  ./configure --enable-maintainer-mode --prefix=/usr --with-mkadms=/usr/bin/admsXml
  make

  cd $srcdir/qucs/qucs-core
  ./bootstrap.sh
  ./configure --enable-maintainer-mode --prefix=/usr --with-mkadms=/usr/bin/admsXml
  make
}

package() {
  cd $srcdir/qucs/qucs
  make DESTDIR="$pkgdir" install

  cd $srcdir/qucs/qucs-core
  make DESTDIR="$pkgdir" install
}
