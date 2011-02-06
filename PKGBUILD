# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=gdatafs
pkgver=1.0.1
pkgrel=2
pkgdesc="Gdatafs is a FUSE implemtation that mount picassa web and youtube to your filesystem"
url="http://gdatafs.sourceforge.net"
license="GPL"
depends=('fuse' 'jdk')
source=(http://voxel.dl.sourceforge.net/sourceforge/gdatafs/gdatafs_$pkgver.tar.gz
		  http://gdatafs.svn.sourceforge.net/viewvc/gdatafs/trunk/jni/i686/libjavafs.so?revision=25)
md5sums=('e838aff1f3fddb275015aff0905d962c'
			'fa641cfd6b9ef75a06dae8ee565d0a1d')
arch=('i686' 'x86_64')
build() {
	pushd ${srcdir}/gdatafs\ $pkgver || return 1
		install -d $pkgdir/opt/gdatafs || return 1
		find . -type f -exec install -D '{}' $pkgdir/opt/gdatafs/'{}' \; || return 1
		install -d $pkgdir/opt/gdatafs/jni/i686 || return 1
		install -D "../libjavafs.so?revision=25" $pkgdir/opt/gdatafs/jni/i686/libjavafs.so || return 1
		install -d $pkgdir/usr/bin || return 1
		echo -e "#! /bin/sh\n\npushd /opt/gdatafs > /dev/null\n\t/opt/gdatafs/gdatafs \"\$1\" \"\$2\" \"\$3\"\npopd > /dev/null" > $pkgdir/usr/bin/gdatafs || return 1
		chmod 755 $pkgdir/usr/bin/gdatafs || return 1
	popd || return 1
}
