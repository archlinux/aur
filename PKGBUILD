# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=eviacam
pkgver=2.0.1+r648.65a817d
pkgrel=1
pkgdesc="eViacam - Mouse replacement software that moves the pointer as you move your head."
arch=('any')
url="http://eviacam.sourceforge.net"
license=('GPL v3')
depends=('opencv' 'wxgtk' 'gtk2' 'libxext' 'libxtst')
makedepends=('git' 'libtool' 'automake' 'autoconf')
# conflicts=('')
# provides=('')
source=("$pkgname"::'git+http://git.code.sf.net/p/eviacam/eviacam')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

	cd "$srcdir/$pkgname"
    
	# Use the tag of the last commit
    	printf "2.0.1+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    	# git log -1 --format='%cd.%h' --date=short | tr -d -
    
}


build() {

    	cd "$srcdir/$pkgname"
    
    	msg2 "  -> Build program..."
    	./autogen.sh
    	./configure
    	make
    
}

package() {

    	cd "$srcdir/$pkgname" 
    
    	msg2 "  -> Installing program..."
    	make DESTDIR=$pkgdir install
    
}

# vim: ts=2 sw=2 et: