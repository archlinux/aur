# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=hyprland-autoname-workspaces-git
_pkgname=${pkgname%-git}
pkgver=1.0.0.r0.g91ecf18
pkgrel=1
pkgdesc='Hyprland autoname workspace.'
arch=('x86_64' 'aarch64')
url="https://github.com/hyprland-community/${_pkgname}"
license=('ISC')
depends=('otf-font-awesome' 'hyprland' 'systemd-libs')
makedepends=('cargo' 'git' 'clang' 'gcc' 'pkgconf')
conflicts=("hyprland-autoname-workspaces" "hyprland-autoname-workspaces-bin")
provides=("hyprland-autoname-workspaces")
optdepends=('waybar-hyprland-git: waybar for hyprland')
source=("git+https://github.com/hyprland-community/${_pkgname}.git")
validpgpkeys=('C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
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
