# Maintainer: Hantz V <dev at hantz dot sh>
pkgname=qi3pc
pkgver=0.4.1
pkgrel=1
pkgdesc="Qt bindings for i3wm's IPC interface"
arch=(x86_64)
url="https://qi3pc.hantz.sh"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'qt6-base' 'i3-wm>=4.24')
makedepends=('cmake' 'doxygen')
checkdepends=('xorg-server-xvfb')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~hantz/qi3pc/refs/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::https://git.sr.ht/~hantz/qi3pc/refs/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
noextract=()
sha256sums=('74f990c4dc2c3a51820fbd863829a71d23687263c856a7060355ffb1eae3ddba'
            'SKIP')
validpgpkeys=('4E6BD8F6E1635AA9ED2E74695010C6B8DB833CF4') # Hantz V

build() {
    cd ${pkgname}-${pkgver}
    cmake -S . -B build/ -DBUILD_DOCS=ON -DCMAKE_BUILD_TYPE=Release -DPROJECT_TAG=${pkgver}
    cmake --build build/
}

package() {
    cd ${pkgname}-${pkgver}
    cmake --install build/ --prefix "$pkgdir/usr"
}
