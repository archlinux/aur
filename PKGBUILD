# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=mblock
orginalname=mBlock
pkgver="4.0.0"
pkgrel=4
pkgdesc="Program Robots / Arduino Without writing a single line of code"
arch=('x86_64')
url="http://www.mblock.cc/"
license=('GPL')
depends=('systemd' 'gconf')

source=("https://github.com/Makeblock-official/$orginalname/releases/download/V$pkgver-Linux/$orginalname-$pkgver-linux-$pkgver.tar.gz"
	"$pkgname.install"
	"sysusers.d" 
	"10-mblockhid.rules" 
	"$pkgname.desktop" 
	"32x32.png" 
	"48x48.png" 
	"128x128.png"
)
sha256sums=('ac658672952419e786c876e9c96b61e52036326bbb3d7942a7603b8f48290988'
		'5d5c2619045c83428dc85145b42041a43ec148e462a1ddab7ba283caffa17a13'
		'e5edbba14326e507f5272356acc587ef62fb40b2854f0719d304312ff43fc5bc'
		'80cbfc60432811b9b48306cb294a70830c1531f36279933263daf2e99311acd2'
		'9f22e57b50dcb097d60e739b3d4c00ccb2693526a4d518e26990e761de21a058'
		'7ea6dc9c9d5b4eb5f7834493ac403234643cb40b9753d691dba6ce96d2ab896a'
		'7ea6dc9c9d5b4eb5f7834493ac403234643cb40b9753d691dba6ce96d2ab896a'
		'7ea6dc9c9d5b4eb5f7834493ac403234643cb40b9753d691dba6ce96d2ab896a'		
	)
install=$pkgname.install
options=(!strip)

package() {

  install -dm 755 $pkgdir/{opt,/usr/{share/{applications,icons/$pkgname},lib/sysusers.d,bin},/etc/udev/rules.d}
  cp -r "${srcdir}/${orginalname}" $pkgdir/opt/$pkgname
  chmod -R 755 $pkgdir/opt/$pkgname
  install -dm 777 $pkgdir/opt/$pkgname/mblock-setting
  
  install -Dm644 ${srcdir}/sysusers.d "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 ${srcdir}/10-mblockhid.rules "${pkgdir}/etc/udev/rules.d/10-mblockhid.rules"
  install -Dm644 ${srcdir}/$pkgname.desktop "${pkgdir}/usr/share/applications"
  install -Dm644 ${srcdir}/{32x32,48x48,128x128}.png "${pkgdir}/usr/share/icons/$pkgname"
  
  echo "#!/bin/bash" > $srcdir/$pkgname.sh
  echo "/opt/$pkgname/$pkgname" >> $srcdir/$pkgname.sh
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
}
