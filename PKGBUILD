# Maintainer: Cristian Burneci <cburneci at gmail dot com>

pkgname=tv-lite
pkgver=0.7.6
pkgrel=1
pkgdesc="IPTV viewer with Sopcast and Acestream handling capabilities.  It wants to be a replacement for the older TV-Maxe"
arch=('i686' 'x86_64')
url="https://www.tv-lite.com"
license=('GPL2')
groups=()
depends=('vlc' 'wxgtk3' 'sqlite' 'curl' 'util-linux-libs')
makedepends=('rapidjson' 'cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/cburneci/tv-lite/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)

noextract=()
md5sums=('608759396137d4d10edce94f1c6e4230') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  mkdir -p build
  cd build
  if [ -f '/usr/bin/wx-config-gtk3' ]
  then 
    echo "Old wx-config found"
    wxcfg="wx-config-gtk3"
  else
    wxcfg="wx-config"
  fi    
  cmake -DWX_CONFIG=$wxcfg ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src/build"

  make DESTDIR="$pkgdir/" install
}
