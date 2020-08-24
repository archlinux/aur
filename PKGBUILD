# Maintainer: Cameron Katri <katri.cameron@gmail.com>
pkgname=xar-tpoechtrage-git
_pkgname=xar
pkgver=xar.1.6.1.r12.g2b9a4ab
pkgrel=1
pkgdesc='eXtensible ARchive format'
arch=('x86_64')
url=''https://github.com/tpoechtrager/xar
license=('custom:BSD')
conflicts=('xar')
provides=('xar')
depends=('libxml2' 'bzip2' 'acl' 'openssl')
makedepends=('git')
source=('git+https://github.com/tpoechtrager/xar.git')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_pkgname}/xar
    ./autogen.sh --prefix=/usr --with-bzip2 --with-lzma
    make
}

package() {
    cd $srcdir/${_pkgname}/xar
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
