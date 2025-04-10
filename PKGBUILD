# Maintainer: taotieren <admin@taotieren.com>

pkgbase=qnetstatview
pkgname=qnetstatview
pkgver=1.5.8
pkgrel=1
groups=()
pkgdesc="QNetStatView - program that will show you detailed listings of all TCP and UDP endpoints on your system, including the local and remote addresses and state of TCP connections."
arch=($CARCH)
url="https://bitbucket.org/admsasha/qnetstatview"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    bash
    gcc-libs
    glibc
    hicolor-icon-theme
    qt6-5compat
    qt6-base
)
makedepends=(
    qt6-tools
    pkgconf
)
optdepends=()
source=(https://bitbucket.org/admsasha/qnetstatview/get/v${pkgver}.tar.gz)
sha256sums=('1dd2bb18cb6dab448218eaa29c132be119a4df576f5c12b637241f21467f66fc')

prepare() {
    mv admsasha-qnetstatview-* qnetstatview-$pkgver
}

build() {
    cd "${pkgname}-${pkgver}"
    qmake6 PREFIX=/usr \
        QMAKE_CFLAGS="${CFLAGS}" \
        QMAKE_CXXFLAGS="${CXXFLAGS}" -r

    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    install -m644 -D COPYING \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
