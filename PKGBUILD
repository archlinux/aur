# Maintainer: Lucy E. Arias <matcraft94@github.com>
pkgname=vivobook-rgb
pkgver=0.3.0
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
sha256sums=('1a602129a7fa40988290eb652cac48ab69aa87712abad4e70d78ae069c5d132c')

package() {
    cd "${pkgname}-${pkgver}"

    # Script principal
    install -Dm755 vrgb.py "${pkgdir}/usr/bin/vrgb"

    # Reglas udev
    install -Dm644 99-vrgb.rules "${pkgdir}/etc/udev/rules.d/99-vrgb.rules"

    # Configuración por defecto del servicio
    install -Dm644 vrgb.conf "${pkgdir}/etc/vrgb.conf"

    # Servicio systemd (opcional: color al boot y tras suspend/resume)
    install -Dm644 vrgb-default.service "${pkgdir}/usr/lib/systemd/system/vrgb-default.service"

    # Licencia
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Documentación
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Man page y completions
    install -Dm644 vrgb.1 "${pkgdir}/usr/share/man/man1/vrgb.1"
    install -Dm644 completions/vrgb.fish "${pkgdir}/usr/share/fish/vendor_completions.d/vrgb.fish"
}
