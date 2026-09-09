# Maintainer: Lucy E. Arias <matcraft94@github.com>
pkgname=vivobook-rgb
pkgver=0.2.0
pkgrel=1
pkgdesc="RGB keyboard control for ASUS Vivobook laptops via HID LampArray"
arch=('any')
url="https://github.com/matcraft94/vivobook-rgb"
license=('MIT')
depends=('python')
optdepends=('systemd: for vrgb-default.service support')
install=vivobook-rgb.install
backup=('etc/vrgb.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
# NOTE: run `updpkgsums` after pushing the v${pkgver} tag to GitHub,
# then regenerate .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`.
sha256sums=('f2791e510612c95572eac305f1553b89eb10741e5c09abd0fbb8140397839773')

package() {
    cd "${pkgname}-${pkgver}"

    # Script principal
    install -Dm755 vrgb.py "${pkgdir}/usr/bin/vrgb"

    # Reglas udev
    install -Dm644 99-vrgb.rules "${pkgdir}/etc/udev/rules.d/99-vrgb.rules"

    # Configuración por defecto del servicio
    install -Dm644 vrgb.conf "${pkgdir}/etc/vrgb.conf"

    # Servicio systemd (opcional)
    install -Dm644 vrgb-default.service "${pkgdir}/usr/lib/systemd/system/vrgb-default.service"

    # Licencia
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Documentación
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
