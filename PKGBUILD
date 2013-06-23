# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-par
pkgver=0.03.01
pkgrel=2
pkgdesc="Quake PAK archiving utility."
url="ftp://ibiblio.org/pub/linux/games/quake/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("ftp://ibiblio.org/pub/linux/games/quake/par-$pkgver.tar.gz")
md5sums=('39a73b5b95b04067dfc9acb8ef6bc9ff')

build() {
    cd $srcdir/par-$pkgver
    ./configure
    make
}

package() {
    cd $srcdir/par-$pkgver

    # Modify Prefix Directory in Makefile
    /bin/sed -i "s:/usr/local:$pkgdir/usr:" Makefile.Linux

    # Modify man page Directory in Makefile
    /bin/sed -i "s:\${prefix}/man:$pkgdir/usr/share/man:" Makefile.Linux

    # Create Destination Directories
    install -d $pkgdir/usr/{bin,share/man/man1}

    make install
}
