pkgname=quicktile-git
pkgver=20140626
pkgrel=1
url="https://github.com/ssokolow/quicktile"
pkgdesc="Lightweight standalone alternative to Compiz Grid plugin"
arch=('any')
license=('GPLv2')
depends=('python2' 'pygtk' 'python2-xlib' 'python2-wnck')
optdepends=('python2-dbus')
makedepends=('git')

_gitroot='git://github.com/ssokolow/quicktile.git'
_gitname='quicktile'

build()
{
	cd $srcdir

	msg "Cloning quicktile from GIT"
	if [ -d $_gitname ]; then
		cd $_gitname
		git pull || return 1
	else
		git clone $_gitroot $_gitname || return 1
		cd $_gitname
	fi
}

package()
{
	install -Dv -m755 ${srcdir}/quicktile/quicktile.py \
	$pkgdir/usr/bin/quicktile
}
