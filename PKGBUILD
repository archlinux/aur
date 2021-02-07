# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Rolf Pfeffertal <floss at notthispart tropf dot io>
pkgname=smplxmpp
pkgver=0.9.3
pkgrel=1
epoch=
pkgdesc="simple XMPP client for the commandline"
arch=('i686' 'x86_64')
url="https://smplxmpp.com/"
license=('GPL3')
groups=()
depends=('spdlog' 'gloox' 'gnutls')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=('smplxmpp') # doesn't exist currently
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tropf/smplxmpp/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('2544a09fa5a71efe97d6eb79c99d012767964ae835989df0975d80f95c4e87bf')
validpgpkeys=()

build() {
	cmake -B build -S "${srcdir}/${pkgname}" -Wno-dev \
            -DBUILD_DOCUMENTATION=OFF \
            -DSMPLXMPP_INSTALL_LICENSE=OFF \
            -DSMPLXMPP_LICENSE_INSTALL_DIR=/usr/share/licenses/common/GPL3 \
            -DSMPLXMPP_LICENSE_INSTALL_FILENAME=license.txt \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX:PATH=/usr \
            -DSMPLXMPP_VERSION_GUESS_GIT=OFF \
            -DSMPLXMPP_VERSION=${pkgver}
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}

