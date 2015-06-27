# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=tbo-git
pkgver=1.0+r253.8d5c99b
pkgrel=1
pkgdesc="Gnome easy and fun comic editor"
arch=('any')
url="https://github.com/danigm/tbo"
license=('GPL')
makedepends=('gnome-common' 'git' 'intltool' 'automake' 'gcc')
depends=('gtk3' 'cairo' 'librsvg' 'git')
# conflicts=('')
# provides=('')
source=("$pkgname"::'git+https://github.com/danigm/tbo')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
    
	cd "$srcdir/$pkgname"
  
	# Use the tag of the last commit
    	printf "1.0+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    
}

build() {

    	cd "$srcdir/$pkgname"
  
    	msg2 "  -> Build program..."
	./autogen.sh --prefix=/usr

}

package() {

    	cd "$srcdir/$pkgname"

    	rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}

    	msg2 "  -> Installing program..."
    	make DESTDIR=$pkgdir install

}

# vim:set ts=2 sw=2 et: