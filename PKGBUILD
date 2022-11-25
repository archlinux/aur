# Maintainer: Danny Waser (Waser Technologies) <danny@waser.tech>

_pkgname=singularity-dynamic-wallpaper
pkgname=$_pkgname
pkgver=1.1
pkgrel=1
pkgdesc='Dynamic wallpaper for Singularity'
arch=(any)
url='https://gitlab.com/waser-technologies/images/wallpapers/singularity-dynamic-wallpaper'
license=('GPL3')
source=("$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	_theme=singularity-spacetime
	
	export _old_installdir=/usr/share/backgrounds
	export _old_propertydir=/usr/share/gnome-background-properties
	export _new_installdir=$pkgdir/usr/share/backgrounds
	export _new_propertydir=$pkgdir/usr/share/gnome-background-properties
	
	sed -i 's|'${_old_installdir}'|'${_new_installdir}'|g' $srcdir/$_pkgname-$pkgver/install.sh
	sed -i 's|'${_old_propertydir}'|'${_new_propertydir}'|g' $srcdir/$_pkgname-$pkgver/install.sh
	
	cd $_pkgname-$pkgver
	./install.sh
	
	#remove unused files
	rm -f $pkgdir/usr/share/backgrounds/$_theme/*property*
}

