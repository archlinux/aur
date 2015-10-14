# Maintainer : Ennoia <ennoia at laposte dot net>

pkgname=jbrout-git
_projectname=jbrout
pkgver=r320.d297ce5
pkgrel=1
pkgdesc="A photo manager with support for IPTC keywords"
arch=('i686' 'x86_64')
url="http://code.google.com/p/jbrout/"
license=('GPL2')
depends=('python2' 'python2-lxml' 'pygtk' 'python2-pillow' 'fbida' 'jhead' 'python2-exiv2>=0.1.2' 'perl-image-exiftool')
#optdepends=('psyco2-svn')
provides=('jbrout')
conflicts=('jbrout' 'jbrout-svn')
source=('git+https://gitlab.com/jbrout/jbrout.git')
md5sums=('SKIP')


pkgver() {
	cd $srcdir/$_projectname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	#python2 $srcdir/$_projectname/setup.py build
	sed -i 's/python/python2/1' $srcdir/$_projectname/dist/data/jbrout
	sed -i 's/jbrout.ico/new_jbrout.svg/1' $srcdir/$_projectname/dist/data/jbrout.desktop
	echo $pkgver > $srcdir/$_projectname/jbrout/data/version.txt
}

package() {
	#python2 $srcdir/$_projectname/setup.py install --root="$pkgdir" --install-purelib=/usr/share/jbrout
	install -D -m755 $srcdir/$_projectname/dist/data/jbrout $pkgdir/usr/bin/jbrout
	install -D -m644 $srcdir/$_projectname/dist/data/jbrout.desktop	$pkgdir/usr/share/applications/jbrout.desktop
	mkdir -p $pkgdir/usr/lib/jbrout/
	cp -r $srcdir/$_projectname/jbrout $pkgdir/usr/lib/
	install -D -m644 $srcdir/$_projectname/jbrout/data/version.txt $pkgdir/usr/lib/jbrout/data/
}
