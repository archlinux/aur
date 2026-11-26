# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary plus its SHA-256-pinned offline resources from GitHub Releases.
pkgname=agent-toolkit-bin
pkgver=1.51.1
pkgrel=1
pkgdesc="Composable AI agent toolkit — native V CLI (prebuilt GitHub Release binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ulises-jeremias/agent-toolkit"
license=('MIT')
provides=('agent-toolkit')
conflicts=('agent-toolkit')
options=('!strip')
resource_bundle_required=1
source_x86_64=("agent-toolkit-1.51.1-linux-x86_64.tar.gz::https://github.com/ulises-jeremias/agent-toolkit/releases/download/v1.51.1/agent-toolkit-1.51.1-linux-x86_64.tar.gz")
source_aarch64=("agent-toolkit-1.51.1-linux-arm64.tar.gz::https://github.com/ulises-jeremias/agent-toolkit/releases/download/v1.51.1/agent-toolkit-1.51.1-linux-arm64.tar.gz")
sha256sums_x86_64=('e278100183cbe89fee4a906c07d7a7dcefa407e048ceb872986694d806fb7ef9')
sha256sums_aarch64=('38ff0ff4ccc3a428606858f0db5517310a48a083337347e77151216378857268')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
    if [[ "${resource_bundle_required}" == "1" && ! -f "${srcdir}/embedded_data.bundle.gz" ]]; then
        echo "standalone release archive is missing its offline resource bundle" >&2
        return 1
    fi
    if [[ -f "${srcdir}/embedded_data.bundle.gz" ]]; then
        install -Dm644 "${srcdir}/embedded_data.bundle.gz" \
            "${pkgdir}/usr/share/agent-toolkit/data/embedded_data.bundle.gz"
        install -Dm644 "${srcdir}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
