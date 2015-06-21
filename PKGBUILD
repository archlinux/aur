# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

_mod=rev_161_mod
pkgname=geepro
pkgver=0.0.4
pkgrel=1
pkgdesc="Willem Programmer software for GNU/Linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/geepro"
license=('GPL')
groups=()
depends=('cairo' 'gtk3' 'libxml2' 'perl' 'intltool' 'pkg-config' 'gettext')
provides=('geepro')
conflicts=('geepro')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-${_mod}.tar.gz
        geepro.desktop)
md5sums=('f7f40bbd9d07b1c9906b3a88cbab36f0'
         '961938da7fc32b0183e6e7b60349da3c')

build() {
  cd "$srcdir/geepro"

  ./waf configure --prefix="$pkgdir/usr"
  ./waf build
}

package() {
  cd "$srcdir/geepro"
  ./waf install
  # Copy icon and .desktop file
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp gui-gtk/icons/logo.xpm "$pkgdir/usr/share/pixmaps/geepro.xpm"
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/geepro.desktop" "$pkgdir/usr/share/applications/"
} 
