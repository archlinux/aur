# Maintainer: Hantz V <dev at hantz dot sh>
_version_name=1.0.0-rc1
_build_tag=1.0.0.1
pkgname=qi3pc
pkgver=1.0.0.rc1
pkgrel=1
pkgdesc="Qt bindings for i3wm's IPC interface"
arch=(x86_64)
url="https://qi3pc.hantz.sh"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'qt6-base' 'i3-wm>=4.24')
makedepends=('cmake' 'doxygen')
checkdepends=('xorg-server-xvfb')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~hantz/qi3pc/archive/${_version_name}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::https://git.sr.ht/~hantz/qi3pc/refs/download/${_version_name}/${pkgname}-${_version_name}.tar.gz.sig")
noextract=()
sha256sums=('be1e0ad5604c3a58d15d794d848c6de67068853c3c504aa9a8f8f0c94b643fe5'
            '9f9b1c6b32e4032a9ca6cff506242010757d468e6155794907e461e4ccccee28')
validpgpkeys=('4E6BD8F6E1635AA9ED2E74695010C6B8DB833CF4') # Hantz V

build() {
    cd ${pkgname}-${_version_name}
    cmake -S . -B build/ -DBUILD_DOCS=ON -DPROJECT_TAG=${_build_tag}
    cmake --build build/
}

package() {
    cd ${pkgname}-${_version_name}
    cmake --install build/ --prefix "$pkgdir/usr"
}
