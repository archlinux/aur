# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd-git
_pkgname=zstd
pkgver=v0.1.0.r0.g305c8c2
pkgrel=2
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/Cyan4973/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
conflicts=('zstd')
provides=('zstd')
source=('git://github.com/Cyan4973/zstd.git')
noextract=()
md5sums=('SKIP') 

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    # Unsure why this is needed. A bug in the makefile?
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

