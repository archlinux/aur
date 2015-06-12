# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=catan-cow-client
pkgver=4.1148
pkgrel=1
pkgdesc="Catan Online World Linux Client"
arch=('i686' 'x86_64')
url="http://www.playcatan.com/cow-download.html"
license=("custom:eula")
install="catan-cow-client.install"
#source=("http://www.catan.com/en/download/?onlineworld_${pkgver/./_}_eng_linux.tgz")
source=("http://www.catan.com/en/download/?PlayCatan_${pkgver/./_}_eng_linux.tgz")
depends=('libx11' 'java-runtime')
md5sums=('8fb9339e4dbc3ef1c1ad0d667dfae776')

package() {
  mkdir -p $pkgdir/usr/{share/{PlayCatan,applications},bin}
  cd $srcdir/PlayCatan/PlayCatan
  /bin/tar cf - * | ( cd ../../../pkg/catan-cow-client/usr/share/PlayCatan/; tar xfp - )
  install -Dm755 ../PlayCatanStarter.sh $pkgdir/usr/bin/PlayCatanStarter.sh
  sed -i 's%MYDIR=.*%MYDIR=/usr/share/PlayCatan/%' $pkgdir/usr/bin/PlayCatanStarter.sh
echo "[Desktop Entry]
Exec=/usr/bin/PlayCatanStarter.sh
Icon=/usr/share/PlayCatan/logo.png
Name=PlayCatan
Path=/usr/share/PlayCatan
StartupNotify=true
Terminal=false
Type=Application
" > $pkgdir/usr/share/applications/Catan_Online_World.desktop
  ##ln -s /usr/share/PlayCatan/PlayCatanStarter.sh $pkgdir/usr/bin/PlayCatanStarter.sh
}
