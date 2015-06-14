# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=gerbv-git
_pkgname=gerbv
pkgver=r1310.9ef643e
pkgrel=1
pkgdesc="An open source Gerber file (RS-274X only) viewer"
url="http://gerbv.geda-project.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
provides=('gerbv')
conflicts=('gerbv')
optdepends=('cairo: for better graphics')
makedepends=('git' 'gettext')
install=$pkgname.install
source=("$_pkgname"::'git://git.geda-project.org/gerbv.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  sed -i 's|am_aux_dir=`cd $ac_aux_dir|am_aux_dir=`cd $srcdir|' configure
}

build ()
{
  cd "$srcdir/$_pkgname"

  ./configure --prefix=/usr \
              --disable-update-desktop-database 
  make 
}

package()
{
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install 
}

