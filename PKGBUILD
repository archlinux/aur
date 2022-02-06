pkgname=torrent-file-editor
pkgver=0.3.17
pkgrel=1
pkgdesc='Cross-platform application intended to create and edit .torrent and uTorrent .dat files.'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools')

_commit='0621e0134014595ae11d31eb901f877857cdd130'
_snapshot="${pkgname}-${_commit}"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/torrent-file-editor/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('24459e74ba29a9f47e464f0d9fd8dd873a39af27ede64d1ac65da6a3c5d1fae5')

build() {
    mkdir -p "${srcdir}/build" && cd "$_"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -GNinja "${srcdir}/${_snapshot}"

    ninja
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    cd "${srcdir}/${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
