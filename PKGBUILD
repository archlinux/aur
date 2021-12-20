# Maintainer: Den Ivanov <securityxiii@gmail.com>
# Contributor: Tadas Lotuzas <tlotuzas@nepgroup.com>

pkgname=libmxf
_commit=9b9860d
pkgver=1.0.4.$_commit
pkgrel=1
pkgdesc="libMXF is a low-level C library for reading and writing the SMPTE ST 377-1 MXF file format."
arch=('x86_64')
url="https://sourceforge.net/p/bmxlib/libmxf/ci/master/tree/"
license=('BSD')
makedepends=('git' 'fakeroot' 'make' 'automake' 'autoconf' 'libtool')
provides=('libmxf')
conflicts=('libmxf')
source=("git+https://git.code.sf.net/p/bmxlib/libmxf.git")
sha256sums=('SKIP')
postinst='postinst'
postupgrade=''
prerm=''
postrm='postrm'

prepare() {
    cd $pkgname
    git checkout $_commit
}

build() {
    cd $pkgname
    bash autogen.sh
    bash ./configure --prefix=/usr --disable-examples CFLAGS="-std=gnu99"
    make -j$(nproc)
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" install
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 INSTALL "$pkgdir/usr/share/doc/$pkgname/INSTALL"
}

