# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=radit-essential
pkgver=1.0.0+r3.6935cc6
pkgrel=1
pkgdesc="Librerías para Radit/iRadit."
url="http://www.radit.org/net"
arch=('any')
license=('GPL v3')
depends=('libbass' 'libbassenc')
source=("$pkgname"::'git+https://github.com/jfperini/radit-essential.git')
makedepends=('git')
# provides=('')
# conflicts=('')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

	cd "$srcdir/$pkgname"
      
	# Use the tag of the last commit
      	printf "1.0.0+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


build()
{

      	cd "$srcdir/$pkgname/qvumeter"
      
	msg2 "  -> Build program..."
	qmake-qt4 qvumeterplug.pro
      	make
      
}


package() {

      	cd "$srcdir/$pkgname/qvumeter"
      
	rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}

    	msg2 "  -> Installing program..."
      	install -d "$pkgdir/usr/lib"
      	cp -u "./libqvumeterplug.so" "$pkgdir/usr/lib"

      	# chmod -R ugo+rX "$pkgdir/opt"
      
}

# vim: ts=2 sw=2 et: