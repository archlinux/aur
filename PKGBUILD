# Maintainer: Hantz V <dev at hantz dot sh>
_version_name=1.0.0
_build_tag=1.0.0
pkgname=qi3pc
pkgver=1.0.0
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
sha256sums=('29fb6159d66c37da64c7c3ce973384f1b2bec50f8aafcb66b485005308638ae9'
            'a1694d6054552610ea8c9db2080fa7b8d65ca615ff7afb94078da43b9162157d')
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
