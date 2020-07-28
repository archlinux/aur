# Maintainer: CrunchySnake

_gitname=lua-pam
pkgname=lua-pam-git
pkgver=r8.7756d5d
pkgrel=1
pkgdesc="A module for lua to use PAM"
arch=(x86_64)
url="https://github.com/RMTT/${_gitname}"
license=(unknown)
depends=(pam lua)
makedepends=(cmake)
provides=(lua-pam)
install=lua-pam-git.install
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
    install -Dm 755 -t "${pkgdir}/usr/lib/${_gitname}" build/liblua_pam.so
}
