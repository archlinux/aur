# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=123elf
pkgver=1.0.0rc4
pkgrel=2
pkgdesc="Native port of Lotus 1-2-3 to Linux."
url="https://github.com/taviso/123elf"
depends=(lib32-ncurses)
makedepends=(cpio)
arch=('i686' 'x86_64')
license=('custom')
source=(https://github.com/taviso/$pkgname/archive/refs/tags/v$pkgver.tar.gz
    https://archive.org/download/123-unix/123UNIX1.IMG
    https://archive.org/download/123-unix/123UNIX2.IMG
    https://archive.org/download/123-unix/123UNIX3.IMG
    https://archive.org/download/123-unix/123UNIX4.IMG
    https://archive.org/download/123-unix/123UNIX5.IMG
    https://ftp.gnu.org/gnu/binutils/binutils-2.38.tar.xz
)
md5sums=('c1d56afbf72353cfc8b1e478dbbb5bb2'
         'b759a30d019b5c7ae221f6119ff6c821'
         'd0dba12e243b6d1f2ee8f27cb0a5c986'
         'aaf8adb12d5915f443b0754ebf0a98d3'
         '1752432abf4951589386db4f8ace4c92'
         '0965e866b299af5046ec7973e7157211'
         '6e39cad1bb414add02b5b1169c18fdc5')
noextract=(binutils-2.38.tar.xz
    123UNIX1.IMG
    123UNIX2.IMG
    123UNIX3.IMG
    123UNIX4.IMG
    123UNIX5.IMG
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ln -s ../../123UNIX1.IMG .
    ln -s ../../123UNIX2.IMG .
    ln -s ../../123UNIX3.IMG .
    ln -s ../../123UNIX4.IMG .
    ln -s ../../123UNIX5.IMG .
    ln -s ../../binutils-2.38.tar.xz .
    CFLAGS="" CPPFLAGS="" LDFLAGS="" ./binutils.sh
    ./extract.sh
    make
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install prefix="$pkgdir"/usr/
}
