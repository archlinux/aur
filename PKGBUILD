# Maintainer: Yaohan Chen <yaohan.chen@gmai.com>
pkgname=anodyne-hib
pkgdesc='A top-down action-adventure game'
url=http://www.anodynegame.com/
license=('custom')
pkgver=1.508
pkgrel=2
arch=(any)
depends=('adobe-air-sdk')
source=(hib://Anodyne_1_508_Linux-1378683147.zip
        air-generic-launcher.sh
        eula.txt)
md5sums=('35d5911b9e14e31153767dd983df50f7'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         'b9cfbd29fb8a1d605e193311b778d7d8')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package() {
  _installdir=/opt/anodyne/share

  cd $srcdir
  install -Dm755 air-generic-launcher.sh $pkgdir/$_installdir/air-generic-launcher.sh
  mv linux/share/META-INF $pkgdir/$_installdir
  mv linux/share/Anodyne.swf $pkgdir/$_installdir

  install -d $pkgdir/usr/bin/
  ln -s $_installdir/air-generic-launcher.sh $pkgdir/usr/bin/anodyne

  install -Dm644 linux/share/icons/IntraAIR32.png $pkgdir/usr/share/pixmaps/anodyne.png

  install -d $pkgdir/usr/share/applications/
  cat > $pkgdir/usr/share/applications/anodyne.desktop <<EOF
[Desktop Entry]
Name=Anodyne
Comment=Anodyne
GenericNAme=Anodyne
Exec=/usr/bin/anodyne
Type=Application
Terminal=false
Icon=anodyne
StartupNotify=true
Categories=Game;
EOF

  install -Dm644 eula.txt $pkgdir/usr/share/licenses/anodyne/eula.txt
}
