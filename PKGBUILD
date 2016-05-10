pkgname=ayam
pkgver=1.23
pkgrel=1
pkgdesc="Ayam is a free 3D modelling environment for the RenderMan interface."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ayam/"
license=('BSD')
depends=('libtiff4')
makedepends=('coreutils')
conflicts=()

_prefix=/opt/$pkgname

source_i686=(http://downloads.sourceforge.net/$pkgname/$pkgname$pkgver.linux.i386.tar.gz)
source_x86_64=(http://downloads.sourceforge.net/$pkgname/$pkgname$pkgver.linux.amd64.tar.gz)

md5sums_i686=('175769c393cd97b07f194fc6a237d18a')
md5sums_x86_64=('69a29c81706452ad751ea86c1c83352e')

package() {
  cd "$srcdir"

  install -d $pkgdir/opt/$pkgname
  cp -r $pkgname/* $pkgdir/opt/$pkgname

#desktop
#  sed -e "s:/usr/local/ayam:$_prefix:g" $pkgdir/$_prefix/bin/ayam-desktop.desktop > $pkgdir/$_prefix/bin/ayam.desktop
#  chmod 755 $pkgdir/$_prefix/bin/ayam.desktop
#  xdg-desktop-icon install --novendor $pkgdir/$_prefix/bin/ayam.desktop

#sysmenu
  sed -e "s:/usr/local/ayam:$_prefix:g" $pkgdir/$_prefix/bin/ayam-desktop.desktop > $pkgdir/$_prefix/bin/ayam.desktop
  install -d $pkgdir/usr/share/applications
  cp $pkgdir/$_prefix/bin/ayam.desktop $pkgdir/usr/share/applications/ayam.desktop
#  chmod 755 $pkgdir/usr/share/applications/ayam.desktop

#filetype
#  xdg-mime install $pkgdir/$_prefix/bin/ayam-filetype.xml
#  xdg-mime default ayam.desktop application/ayam
#  xdg-icon-resource install --novendor --context mimetypes --size 32 $pkgdir/$_prefix/bin/ayam_icon_32.png application-ayam

  export PATH=$PATH:/opt/ayam/bin
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ayam/bin/plugins
}
