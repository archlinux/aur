# Maintainer: Ishaan Jindal <github.com/ishaan-jindal>

pkgname=ishaans-termchat-bin
_pkgname=termchat
pkgver=2.1.0
pkgrel=1
pkgdesc='Minimal anonymous terminal chatrooms — lightweight single-binary TUI client'
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/ishaan-jindal/termchat'
license=('MIT')
provides=('termchat')
conflicts=('ishaans-termchat')

_base_url="https://github.com/ishaan-jindal/termchat/releases/download/cli-v${pkgver}"

source_x86_64=("termchat-linux-amd64-${pkgver}::${_base_url}/termchat-linux-amd64")
source_aarch64=("termchat-linux-arm64-${pkgver}::${_base_url}/termchat-linux-arm64")
source_i686=("termchat-linux-386-${pkgver}::${_base_url}/termchat-linux-386")

sha256sums_x86_64=('c21aa67bf8e8f3046964d76889380213147c47d2bf4a3d2e36ca12c8322a2066')
sha256sums_aarch64=('f2804aad5fe6c77c88cb89c049c93b867b70a590e3c147e07c1c6caea9417636')
sha256sums_i686=('e8713b5e659632b9d28a321e270378bbb0e5ad8c06b0b609b43281b3006ec16f')

# Man page and license from the source repo
source=("termchat.1::https://raw.githubusercontent.com/ishaan-jindal/termchat/cli-v${pkgver}/doc/termchat.1"
        "LICENSE::https://raw.githubusercontent.com/ishaan-jindal/termchat/cli-v${pkgver}/LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
    # Determine the correct binary name for this architecture
    case "$CARCH" in
        x86_64)  _binary="termchat-linux-amd64-${pkgver}" ;;
        aarch64) _binary="termchat-linux-arm64-${pkgver}" ;;
        i686)    _binary="termchat-linux-386-${pkgver}" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/termchat"
    install -Dm644 "${srcdir}/termchat.1" "${pkgdir}/usr/share/man/man1/termchat.1"
    install -Dm644 "${srcdir}/LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
