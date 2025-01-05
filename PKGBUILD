# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>

_pkgname="MagiTerm"
pkgname=$(echo ${_pkgname} | tr '[:upper:]' '[:lower:]')-git
pkgver=0
pkgrel=0
pkgdesc="MagiTerm is a simple SSH & telnet terminal for accessing bulletin board systems. It is built on libssh and SDL2."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://talismanbbs.org/other/"
license=('GPL-3.0-or-later')
depends=('libssh' 'sdl2' 'sdl2_image' 'libsecret')
optdepends=("gnome-keyring: Password Saving Feature")

makedepends=('libssh' 'sdl2' 'sdl2_image' 'libsecret')

source=("git+https://gitlab.com/magickabbs/${_pkgname}.git")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}"
    cmake -B build -S . \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -Wno-dev
    cmake --build build
}

package() {
    cd "${_pkgname}"

    install -Dm755 build/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

