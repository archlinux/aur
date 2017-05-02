# Maintainer: Felix Igelbrink
pkgname=roboware-studio
pkgver=0.5.1
pkgrel=1493340874
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
source=(https://github.com/tonyrobotics/RoboWare/raw/master/${pkgname}_${_debver}_${_debarch}.deb)

if [ "$_debarch" = 'i386' ]; then
  md5sums=('cef079774660cd512e9a92fd36ad8cef')
elif [ "$_debarch" = 'amd64' ]; then
  md5sums=('cce2580e67b2e33b2e53dfb3294cf2e5')
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
