# Maintainer: Delfour.co <contact@delfour.co>
pkgname=gnome-shell-extension-claude-pulse
pkgver=1.1.0
pkgrel=1
pkgdesc="Real-time Claude Code agent monitoring for GNOME Shell"
arch=('any')
url="https://github.com/delfour-co/claude-pulse"
license=('MIT')
depends=('gnome-shell>=45' 'jq')
makedepends=('glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/delfour-co/claude-pulse/archive/v${pkgver}.tar.gz")
sha256sums=('e1c678f0fd9be1b5f55f56e4c5ab23d40c8b06baf4349b041696873d529fffed')

_uuid="claude-pulse@delfour.co"

build() {
    cd "claude-pulse-${pkgver}"
    glib-compile-schemas extension/schemas/
}

package() {
    cd "claude-pulse-${pkgver}"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -r extension/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"

    install -Dm755 hooks/claude-pulse-hook.sh "${pkgdir}/usr/bin/claude-pulse-hook.sh"
    install -Dm755 hooks/compute-cost.sh "${pkgdir}/usr/bin/claude-pulse-compute-cost.sh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
