# Contributor: Christoph Lehmann (OpenGeoSys)
pkgname=mgis
pkgver=2.2
pkgrel=1
pkgdesc="Support for MFront generic behaviours"
arch=("x86_64")
url="https://github.com/thelfer/MFrontGenericInterfaceSupport"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%}" mfront-generic-interface-support)
conflicts=("${pkgname%}" "${pkgname%-git}" mfront-generic-interface-support)
replaces=()
backup=()
options=()
install=
source=('mgis.tar.gz::https://github.com/thelfer/MFrontGenericInterfaceSupport/archive/refs/tags/MFrontGenericInterfaceSupport-2.2.tar.gz')
sha512sums=('38a015d790a29d174aa9b37a81df4054d15522a3b31ae80f5d64efc0c696093c3efedd7879db616ee7c093455712abdca760a9dd02458eecc88f3cb3e9cfc513')

build() {
    mv MFrontGenericInterfaceSupport-*${pkgver} ${pkgname}
    cd "$srcdir"
    mkdir -p build
    cd build
    cmake "../${pkgname}" -DCMAKE_BUILD_TYPE=Debug
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
