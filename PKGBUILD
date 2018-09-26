pkgname=roboware-studio
pkgver=1.2.0
pkgrel=1524709819
pkgdesc="IDE for ROS(Robot Operating System) developers based on VSCode"
arch=('x86_64')
url="http://www.roboware.me"
license=('MIT')
depends=('libnotify' 'nss>=3.0.0')
provides=('roboware-studio')

install=$pkgname.install
source=(https://github.com/tonyrobotics/RoboWare/raw/master/Studio/${pkgname}_${pkgver}-${pkgrel}_amd64.deb)

sha256sums=('64366ac8f16b1e87040cc20f6f9f2cefe07b2efa864862f9c9c04c7842133d1d')

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

