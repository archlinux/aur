# Maintainer: Den Ivanov <securityxiii@gmail.com>  
# Contributor: Tadas Lotuzas <tlotuzas@nepgroup.com>

pkgname=libmxfpp
_commit=dd02a08
pkgver=1.0.4.$_commit
pkgrel=1
pkgdesc="libMXF++ is a C++ wrapper library for libMXF that supports reading and writing the SMPTE ST 377-1 MXF file format."
arch=('x86_64')
url="https://sourceforge.net/p/bmxlib/libmxfpp/ci/master/tree/"
license=('BSD')
depends=('libmxf>=1.0.4')
makedepends=('libmxf' 'git' 'fakeroot' 'make' 'automake' 'autoconf' 'libtool')
provides=('libmxfpp')
conflicts=('libmxfpp')
source=("git+https://git.code.sf.net/p/bmxlib/libmxfpp.git")
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
}

