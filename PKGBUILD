# $Id: PKGBUILD 77041 2010-04-10 14:42:02Z andrea $
# Maintainer:
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xdialog
pkgver=2.3.1
pkgrel=4
pkgdesc="A drop-in replacement for the 'dialog' or 'cdialog' programs"
url="http://xdialog.dyns.net/"
arch=('i686' 'x86_64')
depends=('sh' 'gtk')
license=('GPL')
source=("http://xdialog.free.fr/Xdialog-${pkgver}.tar.bz2")
md5sums=('0671f8353717513bf1f0ebc80e9710f6')

build() {
  cd $srcdir/Xdialog-$pkgver
  ./configure --prefix=/usr \
    --mandir=${pkgdir}/usr/share/man

  # Fix bugs in automake - see Xdialog.spec
  /bin/sed -i -e "s:RANLIB = @RANLIB@:RANLIB = /usr/bin/ranlib:" lib/Makefile
  /bin/sed -i -e "s;XGETTEXT = :;XGETTEXT = /usr/bin/xgettext;" po/Makefile

  make || return 1
}

package() {
  cd ${srcdir}/Xdialog-${pkgver}
  make prefix=${pkgdir}/usr install || return 1
}
