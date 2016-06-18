# Maintainer: David Vilar <davvil@gmail.com>
pkgname=vassal
pkgver=3.2.16
pkgrel=3
pkgdesc="Game engine for building and playing online adaptations of board games and card games."
arch=('i686' 'x86_64')
url="http://www.vassalengine.org/"
license=('LGPL')
groups=()
depends=('java-runtime')
makedepends=('')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/vassalengine/files/VASSAL-current/VASSAL-${pkgver}/VASSAL-${pkgver}-linux.tar.bz2
        VASSAL-256x256.png)
noextract=()
md5sums=('8e80b0096778c485d264b7c29f08fd63'
         '4a4ec11bdbd7dbbf56e6f1d533f69a7e')
build() {
  true
}

package() {
  cd "$srcdir/VASSAL-$pkgver"
  destdir=$pkgdir/usr/share/java/$pkgname

  mkdir -p $destdir
  
  cp -r doc lib $destdir

  mkdir -p $pkgdir/usr/bin
  cat << EOF > $pkgdir/usr/bin/vassal
#!/bin/bash
cd /usr/share/java/$pkgname && java -classpath lib/Vengine.jar VASSAL.launch.ModuleManager "\$@"
EOF
  chmod a+x $pkgdir/usr/bin/vassal

  mkdir -p $destdir/images
  cp $srcdir/VASSAL-256x256.png $destdir/images

  mkdir -p $pkgdir/usr/share/applications
  cat << EOF > $pkgdir/usr/share/applications/vassal.desktop
[Desktop Entry]
Comment=${pkgdesc}
Terminal=false
Name=Vassal
Exec=/usr/bin/vassal
Type=Application
Icon=/usr/share/java/${pkgname}/images/VASSAL-256x256.png
EOF

}

# vim:set ts=2 sw=2 et:
