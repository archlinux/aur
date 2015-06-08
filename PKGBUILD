# Maintainer: “0xReki” <mail@0xreki.de>
# Contributor: “0xReki” <mail@0xreki.de>
# Contributor: hardfalcon <?>
_pkgname=libnfc
pkgname="${_pkgname}-git"
pkgver=1.7.1.r28.gef74d81
pkgrel=1
pkgdesc='Platform independent Near Field Communication (NFC) library'
arch=('i686' 'x86_64')
url="http://nfc-tools.org/"
license=('LGPL3')
depends=('pcsclite' 'libusb')
makedepends=('doxygen' 'zip' 'git')
provides=("libnfc=${pkgver}")
conflicts=(libnfc libnfc-svn)
replaces=(libnfc-svn)
source=("git+https://github.com/nfc-tools/libnfc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^'"${_pkgname}-"'//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${_pkgname}
    ./make_release.sh
    #autoreconf -vis
    ./configure --prefix /usr --enable-doc
}

build() {
    cd ${srcdir}/${_pkgname}
    make
}

package() {
    cd ${srcdir}/${_pkgname}
    make DESTDIR=${pkgdir} install
}
