# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=volctl-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Per-application volume control for GNU/Linux desktops (binary release)"
arch=("x86_64")
url="https://buzz.github.io/volctl/"
license=("GPL3")
depends=("gtk4" "gtk4-layer-shell" "glib2" "cairo" "libpulse")
optdepends=("pavucontrol: mixer support"
            "statusnotifier-introspection-dbus-menu: SNI support")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://github.com/buzz/volctl/releases/download/v${pkgver}/volctl-v${pkgver}-x86_64.tar.gz")
sha256sums=("1623d60c25df6a14a726da633088f455c70d9b0560ca4ae6fcb11897cb018efe")

package() {
    local src="${srcdir}/volctl-v${pkgver}-x86_64"

    # Install binary
    install -Dm0755 "${src}/volctl" \
        "${pkgdir}/usr/bin/${_pkgname}"

    # Install GSettings schema
    install -Dm644 "${src}/data/apps.${_pkgname}.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/apps.${_pkgname}.gschema.xml"

    # Install desktop file
    install -Dm644 "${src}/data/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install license
    install -Dm644 "${src}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
