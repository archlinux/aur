# Maintainer: Thai „RPGReki“ Chung <rpgreki@reki.wtf>
# Contributor: Thai „RPGReki“ Chung <rpgreki@reki.wtf>
# Contributor: hardfalcon <?>
# Contributor: potatoe <?>

_pkgname=libnfc
pkgname="${_pkgname}-git"
pkgver=1.8.0.r79.g3fa0751
pkgrel=1
pkgdesc='Platform independent Near Field Communication (NFC) library'
arch=('x86_64')
url="http://nfc-tools.org/"
license=('LGPL3')
depends=('pcsclite' 'libusb-compat')
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
    ./configure --prefix /usr --enable-doc --sysconfdir=/etc
 
}

build() {
    cd ${srcdir}/${_pkgname}

    make
}

package() {
    cd ${srcdir}/${_pkgname}

    make DESTDIR=${pkgdir} install
}
