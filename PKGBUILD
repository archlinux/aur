# Maintainer: Hans Kramer <kramer@b1-systems.de>

pkgname=linrad-latest
pkgver=latest
pkgrel=1
pkgdesc="Software defined radio receiver for x11, latest code from sourceforge.net"
arch=('x86_64')
url="http://www.sm5bsz.com/linuxdsp/linrad.htm"
license=('custom')
depends=('portaudio' 'libxext' 'libusb-compat')
makedepends=('nasm' 'autoconf')
provides=('linrad')
# checkout latest code
source=(svn+https://svn.code.sf.net/p/linrad/code)

sha512sums=('SKIP')


prepare() {
    cd "code/trunk"
    ./clean
    autoreconf
    ./configure --prefix=${pkgdir} --datadir=/usr/share/${pkgname}
}

build() {
    echo $PWD
    cd "code/trunk"
    make xlinrad64
}

package(){
install -Dm644 $srcdir/code/trunk/xlinrad64 /usr/local/bin/xlinrad64
}

# vim:set ts=2 sw=2 et:
