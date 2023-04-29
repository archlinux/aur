# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-sound-output-device-chooser-git
pkgver=r320.593d652
pkgrel=1
pkgdesc="Enable selection of sound source and sink devices."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser.git"
install=device-chooser.install
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    make build
}

package() {
    cd "${srcdir}/${pkgname}"

    INSTALL_DIR="${pkgdir}/usr/share/gnome-shell/extensions"
    install -dm755 "${INSTALL_DIR}"

    make INSTALL_DIR="${INSTALL_DIR}" install
}
