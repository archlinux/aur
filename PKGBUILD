# Contributor: Radu Potop <radu@wooptoo.com>

pkgname=zlib-ng-git
pkgver=1.2.8
pkgrel=1
pkgdesc='zlib for the "next generation" systems. Drop-In replacement with some serious optimizations.'
arch=('i686' 'x86_64')
license=('zlib')
url="https://github.com/Dead2/zlib-ng"
depends=('glibc')
source=("git://github.com/Dead2/zlib-ng.git")
conflicts=('zlib')
md5sums=('SKIP')
_gitname='zlib-ng'

build() {
    cd ${srcdir}/${_gitname}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${_gitname}
    make install DESTDIR=${pkgdir}

    install -D libz.so ${pkgdir}/usr/lib/libz.so
    install -D libz.so.1 ${pkgdir}/usr/lib/libz.so.1
    install -D libz.so.${pkgver}.zlib-ng ${pkgdir}/usr/lib/libz.so.${pkgver}
    
    install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/zlib/LICENSE
}
