# Maintainer: nhktmdzhg
# Based on lua-pam-git by jasper1378
# Contributor: ZeekSpin
# Contributor: CrunchySnake

_gitname=lua-pam
pkgname=lua53-pam-git
pkgver=latest
pkgrel=1
epoch=1
pkgdesc="A module for lua53 to use PAM"
arch=(x86_64)
url="https://github.com/nhktmdzhg/${_gitname}"
license=('MIT')
depends=(pam lua53)
makedepends=(cmake git)
provides=(lua53-pam)
install=lua53-pam-git.install
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}
    cmake . -B build
    make -C build
}

package() {
    cd ${_gitname}
    install -Dm 755 build/liblua_pam.so -t "${pkgdir}/usr/lib/lua/5.3/"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
