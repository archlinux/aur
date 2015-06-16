# Maintainer: Skad <skadprog@gmail.com>
pkgname="grive-tools"
pkgver=1.15
pkgrel=1
pkgdesc="Grive Tools will assist in the installation and setup of Google Drive under GTK"
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('LGPL 3')
depends=('grive' 'libappindicator-gtk3' 'python2' 'glib2' 'zenity' 
'python2-pyinotify' 'python2-gobject' 'expect')
source=("https://launchpad.net/~thefanclub/+archive/grive-tools/+files/${pkgname}_${pkgver}.tar.gz"	)
md5sums=('SKIP')
install='grive-tools.install'
package() {
	cd $pkgname
	if [ -f /usr/bin/kdesu -a ! -f /usr/bin/gksudo ]; then
  		sed -i 's/gksudo/kdesu/g' usr/share/applications/grive-setup.desktop
	fi
	if [ ! -f /usr/bin/kdesu -a ! -f usr/bin/gksudo ]; then
  		sed -i 's/gksudo/sudo/g' usr/share/applications/grive-setup.desktop
	 	sed -i 's/Terminal=false/Terminal=true/g' usr/share/applications/grive-setup.desktop
	fi

	sed -i 's|\(/usr/bin/env python\)|\12|' opt/thefanclub/$pkgname/grive-indicator
	chmod 755 opt/thefanclub/$pkgname/grive-indicator
	cp -r opt usr $pkgdir/

}

