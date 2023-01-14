# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=hyprland-autoname-workspaces-git
_pkgname=${pkgname%-git}
pkgver=0.2.0.r0.g1c234d5
pkgrel=1
pkgdesc='Hyprland autoname workspace.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${_pkgname}"
license=('ISC')
depends=('otf-font-awesome' 'hyprland' 'systemd-libs')
makedepends=('cargo' 'git' 'clang')
conflicts=("hyprland-autoname-workspaces-git" "hyprland-autoname-workspaces")
provide=("hyprland-autoname-workspaces")
source=("git+https://github.com/cyrinux/${_pkgname}.git")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    make build
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
