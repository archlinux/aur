# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=cinderella
pkgver=2.8
pkgrel=3
pkgdesc="Interactive geometry software"
arch=('any')
url="http://www.cinderella.de/"
license=('Proprietary')
depends=('java-runtime' 'xdg-utils')
makedepends=()
install=
source=("http://www.cinderella.de/files/release/Cinderella_unix_2_8.sh")
md5sums=('bb6ca0c41e22d8949ccbb5b58434d159')

package() {
  _appdir=$pkgdir/usr/share/java/cinderella
  install -d $_appdir

  tail -c 1017201 Cinderella_unix_2_8.sh > sfx_archive.tar.gz
  tar xfz sfx_archive.tar.gz

  java -Dinstall4j.jvmDir=$JAVA_HOME -Dexe4j.moduleName='./Cinderella_unix_2_8.sh' -Dexe4j.totalDataLength=48153719 -Dinstall4j.cwd="$srcdir" -Djava.ext.dirs="$JAVA_HOME/lib/ext" -cp i4jruntime.jar:user.jar com.install4j.runtime.Launcher launch com.install4j.runtime.installer.Installer false false "" "" false true false "" true true 0 0 "" 20 20 "Arial" "0,0,0" 8 500 "version 2.6" 20 40 "Arial" "0,0,0" 8 500 -1 -q -dir "$_appdir"

  cd $_appdir
  sed -i s:$_appdir/Cinderella2:/usr/bin/Cinderella2: "Cinderella 2.desktop"
  mv .install4j/Cinderella2.png .
  sed -i s:$_appdir/.install4j/Cinderella2.png:/usr/share/java/cinderella/Cinderella2.png: "Cinderella 2.desktop"
 
  install -d $pkgdir/usr/share/applications
  mv "$_appdir/Cinderella 2.desktop" $pkgdir/usr/share/applications
  install -d $pkgdir/usr/bin
  ln -s /usr/share/java/cinderella/Cinderella2 $pkgdir/usr/bin

  sed -i "s|jar\\$|jar|" $_appdir/Cinderella2
  sed -i "s|zip\\$|zip|" $_appdir/Cinderella2

  rm $_appdir/uninstall
}
