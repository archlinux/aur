# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=meteo
pkgver=1.0.2+r2.ea7996c
pkgrel=1
pkgdesc="Meteo es un proyecto de software libre que recopila datos meteorológicos para Radit."
url="http://www.radit.org/net"
arch=('any')
license=('GPL v3')
install=meteo.install
depends=('qt4')
makedepends=('git')
# provides=('')
# conflicts=('')
source=("$pkgname"::'git+https://github.com/jfperini/meteo.git')
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
      	install -d $pkgdir/{opt/radit,usr/bin}
      	cp -a "./LinuxDesktop/$pkgname" "$pkgdir/opt/radit"
      	cp -u "./launcher/$pkgname" "$pkgdir/usr/bin"
      
      	chmod -R 775 $pkgdir/opt/radit/$pkgname

      	install -Dm644 "./launcher/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
      	install -Dm644 "./launcher/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

      	# chmod -R ugo+rX "$pkgdir/opt"
      
}

# vim: ts=2 sw=2 et: