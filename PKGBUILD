# Maintainer: crocket <crockabiscuit at gmail dot com>
pkgname=securecopytools
pkgver=1.0.6
pkgrel=1
epoch=
pkgdesc="cp and mv with checksum (crc) verification"
arch=('i686' 'x86_64')
url="http://www.ijntema.com/unrestricted/wiki/index.php/Main_Page#Secure_Copy_Tools"
license=('GPL')
groups=()
depends=()
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
source=(http://downloads.sourceforge.net/project/crcsum/$pkgname-$pkgver.tar.gz)
noextract=()
sha256sums=(1dbc2f62db0284f33afdcc90f5f329c290bde7e6c701f3f4f120453ff5005e3b)

prepare() {
    cd "$srcdir"
    mv securecopy "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    # Delete files already existing in coreutils package.
    rm "$pkgdir/usr/bin/install" "$pkgdir/usr/share/man/man1/install.1"
    rm -r "$pkgdir/usr/share/info"
}
