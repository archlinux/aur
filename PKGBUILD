# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.
#Author: Abouzakaria <zkariakov@gmail.com>
#Maintainer: kovax3 <kovax3@gmail.com>
pkgname=booksorg
pkgver=0.3.1
pkgrel=1
epoch=
pkgdesc="Books Organizer, an organizer for pdf files based on sqlite and with a built-in reader. Bring your favorite PDF pages all in one! Make your own extract 
pages from existing ones"
arch=( 'x86_64')
url="http://elkirtasse.sourceforge.net"
license=('GPL3')
groups=()
depends=('qt5-svg' 'poppler-qt5')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/zakariakov/booksorg/archive/$pkgver.tar.gz"  )
      
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake "booksorganizer.pro" \
    PREFIX=/usr \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

    
    make INSTALL_ROOT="${pkgdir}"/ install || return 1
    find "$pkgdir" -type d -print0 | xargs -0 chmod -R 755
    find "$pkgdir" -type f -print0 | xargs -0 chmod -R 644
    chmod 755 "$pkgdir/usr/bin/booksorg"

}
