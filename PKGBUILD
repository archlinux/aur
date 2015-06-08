# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=knowthelist-git
pkgver=2.3.0+r275.cbc746a
pkgrel=1
pkgdesc="Knowthelist the awesome party music player."
url="https://github.com/knowthelist/knowthelist"
license=('GPL v2')
arch=('any')
depends=('qt4' 'taglib' 'gstreamer0.10' 'gstreamer0.10-base-plugins' 'boost' 'alsa-lib')
makedepends=('git')
# conflicts=('')
# provides=('')
source=("$pkgname"::'git+https://github.com/knowthelist/knowthelist')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

	cd "$srcdir/$pkgname"
    
	# Use the tag of the last commit
    	printf "2.3.0+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    	# git log -1 --format='%cd.%h' --date=short | tr -d -
    
}

build()
{

	cd "$srcdir/$pkgname"
      
	msg2 "  -> Build program..."
    	qmake-qt4 knowthelist.pro
    	make
      
}

package() {

    	cd "$srcdir/$pkgname"
      
    	rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}
      
    	msg2 "  -> Installing program..."
    	install -d $pkgdir/{usr/bin,usr/share}
    	cp -u "./knowthelist" "$pkgdir/usr/bin"

    	msg2 "  -> Installing icons..."
    	install -Dm644 "./dist/knowthelist.png" "$pkgdir/usr/share/pixmaps/knowthelist.png"
      
    	msg2 "  -> Installing .desktop file..."
    	install -Dm644 "./dist/knowthelist.desktop" "$pkgdir/usr/share/applications/knowthelist.desktop"
      
}

# vim: ts=2 sw=2 et: