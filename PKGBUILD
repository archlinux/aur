# Maintainer: Ishaan Jindal <github.com/ishaan-jindal>

pkgname=ishaans-termchat-bin
_pkgname=termchat
pkgver=2.2.0
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

sha256sums_x86_64=('4884a80821077c55398eec9db3c8f17ef9d9720130839fe70afc0a1e6868ca17')
sha256sums_aarch64=('6f4ad0a94aac837aedc97aec6623f3e3cdc3a4ae26e5541caceed2cc04dbeeae')
sha256sums_i686=('33dc443792322246ace3d1f53f1d00c34f0344c9661748430a58bab29357475e')

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
