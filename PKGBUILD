# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xdialog
pkgver=2.3.1
pkgrel=7
pkgdesc="A drop-in replacement for the 'dialog' or 'cdialog' programs"
url="http://xdialog.dyns.net/"
arch=('i686' 'x86_64')
depends=('gtk2')
license=('GPL')
source=("http://xdialog.free.fr/Xdialog-${pkgver}.tar.bz2"
	"xdialog-2.3.1-gtk2.patch")
md5sums=('0671f8353717513bf1f0ebc80e9710f6'
         '1785edbb50316ba07c3ab68f061bf766')

build() {
  cd $srcdir/Xdialog-$pkgver
  patch -p1 <../xdialog-$pkgver-gtk2.patch
  ./configure --prefix=/usr \
    --mandir=${pkgdir}/usr/share/man --with-gtk2
  # Fix bugs in automake - see Xdialog.spec
  sed -i -e "s:RANLIB = @RANLIB@:RANLIB = /usr/bin/ranlib:" lib/Makefile
  sed -i -e "s;XGETTEXT = :;XGETTEXT = /usr/bin/xgettext;" po/Makefile
  make
}

package() {
  cd ${srcdir}/Xdialog-${pkgver}
  make prefix=${pkgdir}/usr install
}
