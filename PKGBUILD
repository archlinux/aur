# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

_mod=rev_161_mod
pkgname=geepro
pkgver=0.0.4
pkgrel=3
pkgdesc="Willem Programmer software for GNU/Linux"
arch=('i686' 'x86_64')
url="https://github.com/enriquebelarte/geepro"
license=('GPL')
groups=()
depends=('cairo' 'gtk3' 'libxml2' 'perl' 'intltool' 'pkg-config' 'gettext')
makedepends=('python2' 'git')
provides=('geepro')
conflicts=('geepro')
source=(geepro::git+$url.git
        geepro.desktop)
md5sums=('SKIP'
         '961938da7fc32b0183e6e7b60349da3c')

build() {
  cd "$srcdir/geepro"

  if [ "$CC" = "clang" ]; then
       CC="gcc"
  fi
  if [ "$CXX" = "clang++" ]; then
       CXX="g++"
  fi
  CFLAGS+=" -fcommon"
  CXXFLAGS+=" -fcommon"
  python2 waf configure --prefix="$pkgdir/usr"
  python2 waf build
}

package() {
  cd "$srcdir/geepro"
  python2 waf install
  # Copy icon and .desktop file
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp gui-gtk/icons/logo.xpm "$pkgdir/usr/share/pixmaps/geepro.xpm"
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/geepro.desktop" "$pkgdir/usr/share/applications/"
} 
