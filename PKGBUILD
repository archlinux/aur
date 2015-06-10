# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=radit
pkgver=1.0.4+r3.a56167b
pkgrel=1
pkgdesc="Radit es un proyecto de software libre para la automatización de emisoras de radio."
arch=('any')
url="http://www.radit.org/net"
license=('GPL v3')
install="$pkgname.install"
depends=('qt4' 'libtaginfo' 'lame' 'vorbis-tools' 'aacplusenc' 'radit-essential' 'meteo' 'raditcast')
makedepends=('git')
# provides=('')
# conflicts=('')
source=("$pkgname"::'git+https://github.com/jfperini/radit.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

	cd "$srcdir/$pkgname"
      
	# Use the tag of the last commit
      	printf "1.0.4+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

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