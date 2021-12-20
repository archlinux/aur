# Maintainer: Den Ivanov <securityxiii@gmail.com>  
# Contributor: Tadas Lotuzas <tlotuzas@nepgroup.com>

pkgname=bmx
_commit=c8db509
pkgver=1.0.3.$_commit
pkgrel=1
pkgdesc="bmx is a library and set of utilities to read and write the SMPTE ST 377-1 MXF file format."
arch=('x86_64')
url="https://sourceforge.net/p/bmxlib/bmx/ci/master/tree/"
license=('BSD')
depends=('libmxf>=1.0.4' 'libmxfpp>=1.0.4' 'uriparser')
makedepends=('libmxf' 'libmxfpp' 'expat' 'libcurl-compat' 'uriparser' 'git' 'fakeroot' 'make' 'automake' 'autoconf' 'libtool')
provides=('bmx')
conflicts=('bmx')
source=("git+https://git.code.sf.net/p/bmxlib/bmx.git")
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
    install -Dm644 TODO-AVC.txt "$pkgdir/usr/share/doc/$pkgname/TODO-AVC.txt"
    install -Dm644 TODO-FEATURES.txt "$pkgdir/usr/share/doc/$pkgname/TODO-FEATURES.txt"
    install -Dm644 TODO-ISSUES.txt "$pkgdir/usr/share/doc/$pkgname/TODO-ISSUES.txt"
}

