# Contributor : Devaev Maxim <mdevaev@gmail.com>

pkgname=cgroupfs-mount-rc
pkgver=20141214
pkgrel=1
pkgdesc="Simple scripts to properly mount the cgroupfs hierarchy"
arch=('any')
url="http://github.com/mdevaev/cgroupfs-mount-rc.git"
license="GPL"
makedepends=('git')

_gitroot="git://github.com/mdevaev/cgroupfs-mount-rc.git"
_gitname="cgroupfs-mount-rc"


build() {
	cd $startdir/src
	if [ -d $_gitname ]; then
		msg "Updateing local repository..."
		cd $_gitname
		git pull origin master || return 1
		msg "The local files are updated."
		cd ..
	else
		git clone $_gitroot --depth=1
	fi

	msg "Git clone done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

    mkdir -p $pkgdir/usr/bin $pkgdir/etc/rc.d
	install -m 755 cgroupfs-mount $pkgdir/usr/bin/cgroupfs-mount
	install -m 755 cgroupfs-umount $pkgdir/usr/bin/cgroupfs-umount
	install -m 755 cgroupfs-rc $pkgdir/etc/rc.d/cgroupfs
}
