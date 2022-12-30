#Maintainer: John Gleezowood <psyrccio@gmail.com>
#Contributor: John Gleezowood <psyrccio@gmail.com>
pkgname=jwildfire
pkgver=7.30
pkgrel=1
pkgdesc="Fractal flame image and animation processor written in Java"
arch=('any')
url="http://www.andreas-maschke.com"
license=('GPL2')
depends=('java-environment' 'bash')
#makedepends=('git' 'qt5-base')
provides=('jwildfire')
conflicts=('jwildfire')

source=("https://jwildfire.overwhale.com/downloads/j-wildfire-7.30.zip" "https://raw.githubusercontent.com/thargor6/JWildfire/master/Delphi/jwildfire_icon.png")
sha256sums=('e6d77ccf10b19adc00bc0d72e14c708bb1fd45d0c50d6d5880e5e0501fdbe5a1' 'c4b30c591d3f00ca163f8b48da7980e0a6f327552aa7e03828d2c5b3f01c66e8')

build() {
  cd "$srcdir"
  rm -rf ./j-wildfire-7.30.zip
  rm -rf ./*.exe
  rm -rf ./start_mac.command
  echo "[Desktop Entry]" > ./jwildfire.desktop
  echo "Type=Application" >> ./jwildfire.desktop
  echo "Version=1.0" >> ./jwildfire.desktop
  echo "Name=JWildFire" >> ./jwildfire.desktop
  echo "Comment=Fractal flame image and animation processor written in Java" >> ./jwildfire.desktop
  echo "Icon=jwildfire" >> ./jwildfire.desktop
  echo "X-GNOME-FullName=JWildFire fractals processor" >> ./jwildfire.desktop
  echo "Exec=jwildfire" >> ./jwildfire.desktop
  echo "Terminal=false" >> ./jwildfire.desktop
  echo "MimeType=image/*;" >> ./jwildfire.desktop
  echo "Categories=Graphics;Science;ImageProcessing;" >> ./jwildfire.desktop
  echo "StartupNotify=true" >> ./jwildfire.desktop
  echo "StartupWMClass=JWildFire-main" >> ./jwildfire.desktop
  echo "#!/bin/sh" > ./jwildfire
  echo "cd /opt/jwildfire" >> ./jwildfire
  echo "sh ./start_linux.sh" >> ./jwildfire
  chmod +x ./jwildfire
}

package() {
  cd "$srcdir"
  mkdir "$pkgdir/opt"
  mkdir "$pkgdir/opt/jwildfire"
  cp -R "$srcdir"/* "$pkgdir"/opt/jwildfire/
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/share/pixmaps"
  mkdir "$pkgdir/usr/share/applications"
  mv "$srcdir"/jwildfire.desktop "$pkgdir/usr/share/applications/jwildfire.desktop"
  mv "$srcdir"/jwildfire "$pkgdir/usr/bin/jwildfire"
  cp "$srcdir"/jwildfire_icon.png "$pkgdir/usr/share/pixmaps/jwildfire.png"
  rm -rf "$pkgdir/opt/jwildfire/jwildfire_icon.png"
}
