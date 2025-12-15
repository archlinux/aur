pkgname=tabular-bin
pkgver=0.5.27
pkgrel=1
pkgdesc="SQL and NoSQL database client (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/tabular-id/tabular"
license=('AGPL3' 'custom:Tabular-EULA')
depends=(gtk3 glib2 openssl libxcb libxkbcommon systemd-libs pango atk hicolor-icon-theme)
optdepends=('update-desktop-database: refresh desktop entries' 'gtk-update-icon-cache: refresh icon cache')
provides=('tabular')
conflicts=('tabular')
source_x86_64=("https://github.com/tabular-id/tabular/releases/download/v${pkgver}/tabular-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/tabular-id/tabular/releases/download/v${pkgver}/tabular-aarch64-unknown-linux-gnu.tar.gz")
source=("tabular.desktop::https://raw.githubusercontent.com/tabular-id/tabular/v${pkgver}/tabular.desktop"
        "LICENSE::https://raw.githubusercontent.com/tabular-id/tabular/v${pkgver}/LICENSE"
        "LICENSE-AGPL::https://raw.githubusercontent.com/tabular-id/tabular/v${pkgver}/LICENSE-AGPL"
        "README.md::https://raw.githubusercontent.com/tabular-id/tabular/v${pkgver}/README.md"
        "logo.png::https://raw.githubusercontent.com/tabular-id/tabular/v${pkgver}/assets/logo.png")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm644 "${srcdir}/tabular.desktop" "${pkgdir}/usr/share/applications/tabular.desktop"
    install -Dm644 "${srcdir}/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tabular.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/LICENSE-AGPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AGPL"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    local tarball binary_name
    case "${CARCH}" in
      x86_64)
        tarball="tabular-x86_64-unknown-linux-gnu.tar.gz"
        binary_name="tabular-x86_64-unknown-linux-gnu"
        ;;
      aarch64)
        tarball="tabular-aarch64-unknown-linux-gnu.tar.gz"
        binary_name="tabular-aarch64-unknown-linux-gnu"
        ;;
      *)
        echo "Unsupported architecture: ${CARCH}" >&2
        return 1
        ;;
    esac

    tar -xzf "${srcdir}/${tarball}" -C "${srcdir}"
    install -Dm755 "${srcdir}/${binary_name}" "${pkgdir}/usr/bin/tabular"
}
