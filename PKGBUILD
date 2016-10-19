# Maintainer: Samuel Martin Moro <samuel@peerio.com>
pkgname=peerio-client
pkgver=1.6.4
pkgrel=2
pkgdesc="Peerio Client"
arch=('i686' 'x86_64')
url='https://peerio.com'
license=('GPL3')
depends=('alsa-lib' 'glibc' 'cairo' 'libdbus' 'fontconfig' 'gconf' 'gdk-pixbuf2' 'gtk3' 'libnotify' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('curl' 'coreutils' 'fakeroot' 'git' 'make' 'patch')
options=('!strip')
#source=('http://linux.peerio.com/sources/${pkgname}-${pkgver}.tar.gz')
source=('http://linux.peerio.com/sources/peerio-client-1.6.4.tar.gz')
md5sums=('8d1a2fd3630613470cff0001e7fbf427')
build() {
    cd "${srcdir}/${pkgname}"
    curl http://linux.peerio.com/sources/07-build.patch >build.patch
    if echo "cf041f3e07ae83a6965ccabed660f860  build.patch" | md5sum --check - --strict --quiet; then
	patch -p0 <build.patch && rm -f build.patch
	make client
    else
	echo "ERROR: patch's md5 sum differs from expected value" >&2
	exit 1
    fi
}
package() {
    cd "${srcdir}/${pkgname}"
    make install PREFIX="${pkgdir}/usr/share" BINPREFIX="${pkgdir}/usr"
}
