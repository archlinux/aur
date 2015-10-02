# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=fbc
pkgver=1.04
pkgrel=1
_bootver=1.04.0
pkgdesc="FreeBASIC Compiler (Release version)"
arch=('i686' 'x86_64')
url="http://www.freebasic.net"
license=('GPL2' 'LGPL')
makedepends=('libffi' 'libtinfo')
provides=('fbc')
conflicts=('freebasic' 'fbc-git')
options=(staticlibs)
source=("https://downloads.sourceforge.net/fbc/FreeBASIC-${_bootver}-source.tar.gz")
sha256sums=('SKIP')

prepare() {
if [ "$CARCH" = "i686" ]; then
_arch='x86'
fi

if [ "$CARCH" = "x86_64" ]; then
_arch='x86_64'
fi

warning "Setting up libffi compatibility headers (run update-libffi-compat as root if build fails)"
warning "Downloading bootstrap fbc compiler"
cd "${srcdir}"
wget http://downloads.sourceforge.net/fbc/FreeBASIC-${_bootver}-linux-${_arch}.tar.gz
tar xzf FreeBASIC-${_bootver}-linux-${_arch}.tar.gz
cd FreeBASIC-${_bootver}-linux-${_arch}
export PATH=`pwd`/bin:${PATH}
}

build() {
cd "${srcdir}/FreeBASIC-${_bootver}-source"
make all
}

package() {
cd "${srcdir}/FreeBASIC-${_bootver}-source"
make prefix="${pkgdir}/usr/" install
}
