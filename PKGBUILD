# Maintainer: Fernando HR Silva <liquuid@gmail.com>
pkgname=subutai-control-center
pkgver=7.0.1
pkgrel=1
pkgdesc="Allows you to access peers, containers and Environments via SSH or RDesktop."
arch=('x86_64')
url="https://subutai.io/"
license=('GPL')
groups=()
depends=('icu' 'qt5-websockets')
makedepends=('fakeroot' 'make' 'qt5-quickcontrols2' 'gcc' 'icu' 'qt5-websockets')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/subutai-io/control-center")
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd "control-center"
  sed "s/^which debuild/#which debuild/g" -i ./configure
  ./configure --no-debian
  qmake
  make -j 8
}

package() {
  mkdir -p $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/opt/subutai/lib
  mkdir -p $pkgdir/opt/subutai/bin
  mkdir -p $pkgdir/opt/subutai/log
  mkdir -p $pkgdir/opt/subutai/Libs
  
  #chmod -R 0777 $pkgdir/opt/subutai/log
  #chmod -R 0777 $pkgdir/opt/subutai/bin

  ln -s /opt/subutai/bin/SubutaiControlCenter $pkgdir/usr/bin/SubutaiControlCenter
  
  cp -v control-center/SubutaiControlCenter $pkgdir/opt/subutai/bin
  cp -v control-center/resources/cc_icon.png $pkgdir/usr/share/icons
}
