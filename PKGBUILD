pkgname=torrent-file-editor
pkgver=0.3.17
pkgrel=3
pkgdesc='Cross-platform application intended to create and edit .torrent and uTorrent .dat files.'
arch=('x86_64')
url="https://${pkgname}.github.io/"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools')

_commit='1ae5f71c3d52fae924efa71b0d8e5893a9ceb2c5'
_snapshot="${pkgname}-${_commit}"

source=("${pkgname}-${pkgver}-${_commit:0:7}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('a0fcfd43f7fb641e64a32919921761df84e06d78531ad45070f367a1f01e7e6e')

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/LICENSE"
}
