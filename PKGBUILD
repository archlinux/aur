pkgname=airmode-git
pkgver=20160808
pkgrel=1
pkgdesc="AirMode - WiFi cracking framework (aircrack interface)"
url="https://github.com/ParrotSec/airmode"
arch=('any')
license=('GPL2')
depends=('gksu' 'pyqt4-common' 'aircrack-ng' 'reaver' 'cowpatty' 'pyrit' 'python2')
_gitroot="https://github.com/ParrotSec/airmode.git"
_gitname="airmode"


build()
{
	cd "$srcdir"
	msg "Connecting to GIT server..."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"

	
}

package()
{
	cd "$srcdir/$_gitname"
	cd $(ls -d *all/)
	cp -r ./usr $pkgdir
	
	rm $pkgdir/usr/share/parrot-menu/applications/parrot-airmode.desktop
	sed -i 's/python /python2 /' $pkgdir/usr/bin/airmode
	sed -i 's/menuexecg /gksudo /' $pkgdir/usr/share/applications/parrot-airmode.desktop
}



