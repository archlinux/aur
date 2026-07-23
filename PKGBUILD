# Maintainer: nhktmdzhg
# Based on lua-pam-git by jasper1378
# Contributor: ZeekSpin
# Contributor: CrunchySnake

_gitname=lua-pam
pkgname=lua54-pam-git
pkgver=r16.3615c98
pkgrel=1
pkgdesc="A module for lua54 to use PAM"
arch=(x86_64)
url="https://github.com/nhktmdzhg/${_gitname}"
license=('MIT')
depends=(pam lua54)
makedepends=(cmake git)
provides=(lua54-pam)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_gitname}
    sed -i 's/5.3/5.4/g' CMakeLists.txt
}

build() {
    cd ${_gitname}
    cmake . -B build
    make -C build
}

package() {
    cd ${_gitname}
    install -Dm 755 build/liblua_pam.so -t "${pkgdir}/usr/lib/lua/5.4/"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
