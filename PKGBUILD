# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=iradit
pkgver=1.0.2+r6.235cab1
pkgrel=1
pkgdesc="iRadit es un proyecto de software libre para el operador de radio."
url="http://www.radit.org/net"
arch=('any')
license=('GPL v3')
install="$pkgname.install"
depends=('qt4' 'taglib' 'lame' 'vorbis-tools' 'radit-essential')
makedepends=('git')
# provides=('')
# conflicts=('')
source=("$pkgname"::'git+https://github.com/jfperini/iradit.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

	cd "$srcdir/$pkgname"
      
	# Use the tag of the last commit
      	printf "1.0.2+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


build()
{

	cd "$srcdir/$pkgname/src"

    	msg2 "  -> Build program..."
      	qmake-qt4 $pkgname.pro
      	make
      
}


package() {

	cd "$srcdir/$pkgname"
      
	rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}

    	msg2 "  -> Installing program..."
      	install -d $pkgdir/{opt/$pkgname,usr/bin}
      	cp -a "./LinuxDesktop/"* "$pkgdir/opt/$pkgname"
      	cp -u "./launcher/$pkgname" "$pkgdir/usr/bin"

      	install -Dm644 "./launcher/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
      	install -Dm644 "./launcher/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

      	# chmod -R ugo+rX "$pkgdir/opt"
      
}

# vim: ts=2 sw=2 et:
