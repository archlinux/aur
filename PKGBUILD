# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-nvidia-util-git
pkgver=r260.01be419
pkgrel=1
pkgdesc="A Gnome extension to show Nvidia GPU information"
arch=('any')
url="https://github.com/ethanwharris/gnome-nvidia-extension"
license=('MIT')
depends=('gnome-shell' 'nvidia-settings' 'nvidia-utils')
makedepends=('git' 'make')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    glib-compile-schemas src/nvidiautil@ethanwharris/schemas/
}

package() {
    cd "${srcdir}/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a src/nvidiautil@ethanwharris "${pkgdir}/usr/share/gnome-shell/extensions"
}
