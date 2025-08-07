# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=hyprland-plugin-easymotion-git
pkgver=r82.c7b12e4
pkgrel=1
pkgdesc="A single dispatcher that brings up window labels and then allows you to execute a user-defined command when one of those labels is typed"
arch=('x86_64')
url="https://github.com/zakk4223/hyprland-easymotion"
license=('BSD')
source=(${pkgname}::git+https://github.com/zakk4223/hyprland-easymotion.git)
sha512sums=('SKIP')
makedepends=('hyprland-git' 'git')
options=(!debug)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 hypreasymotion.so "$pkgdir/usr/lib/hypreasymotion.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-easymotion-git/LICENSE"
}

