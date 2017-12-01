# Maintainer: Felix Igelbrink
pkgname=roboware-studio
pkgver=1.0.2
pkgrel=1512004582
pkgdesc="IDE for ROS(Robot Operating System) developers based on VSCode"
arch=('i686' 'x86_64')
url="http://www.roboware.me"
license=('MIT')
depends=('libnotify' 'nss>=3.0.0')
provides=('roboware-studio')

_debver=$pkgver-$pkgrel
[ "$CARCH" = 'i686' ] && _debarch=i386
[ "$CARCH" = 'x86_64' ] && _debarch=amd64

install=$pkgname.install
source=(https://github.com/tonyrobotics/RoboWare/raw/master/Studio/${pkgname}_${_debver}_${_debarch}.deb)

if [ "$_debarch" = 'i386' ]; then
    md5sums=('7d9ae5c3e009a559c9d7085967e68dc8')
elif [ "$_debarch" = 'amd64' ]; then
    md5sums=('12d017bf513bc8d483f0b1246d5d904e')
fi

prepare() {
  tar -zxf "$srcdir/control.tar.gz"
}
package() {
  bsdtar xf "$srcdir/data.tar.xz" -C "$pkgdir"
  # fix permissions for some directories in the pkg to avoid pacman warnings
  dirs=("/usr" "/usr/share" "/usr/share/applications" "/usr/share/appdata" "/usr/share/pixmaps")
  for dir in "${dirs[@]}" 
  do 
    chmod 755 "$pkgdir$dir"
  done
}

