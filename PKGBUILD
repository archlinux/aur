# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.
#author: Abouzakaria <zkariakov@gmail.com>
#Maintainer: kovax <kovax3@gmail.com>
pkgname=mtafsir
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Interpretation of the holy Quran. tabary ,sa3dy ,qortoby ,ibn 
katheer ,baghawy ,tafsir muyassar ..."
arch=( 'x86_64')
url="http://elkirtasse.sourceforge.net"
license=('GPL3')
groups=()
depends=('qt5-base')
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
source=("https://github.com/zakariakov/mtafsir/archive/$pkgver.tar.gz"  
)
      
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake "mtafsir.pro" \
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
    chmod 755 "$pkgdir/usr/bin/mtafsir"

}
