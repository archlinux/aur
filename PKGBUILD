# Maintainer: Ishaan Jindal <github.com/ishaan-jindal>

pkgname=ishaans-termchat-bin
_pkgname=termchat
pkgver=2.5.0
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

sha256sums_x86_64=('9c1672185145608d6513d993f32f23ad4ce3524ec5329b920316112ed8c0b8ab')
sha256sums_aarch64=('5de5da2657395834d45c66a694b648f7150bbbcdbdc891dad905d241a722d6cb')
sha256sums_i686=('bfa11a5e94f877810c3a1118eda87f73f5adb0ed87f5768d19029c798e1e627a')

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
