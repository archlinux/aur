# Maintainer: Ishaan Jindal <github.com/ishaan-jindal>

pkgname=ishaans-termchat-bin
_pkgname=termchat
pkgver=0.4.2
pkgrel=1
pkgdesc='Minimal anonymous terminal chatrooms — lightweight single-binary TUI client'
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/ishaan-jindal/termchat'
license=('MIT')
provides=('termchat')
conflicts=('ishaans-termchat')

_base_url="https://github.com/ishaan-jindal/termchat/releases/download/cli-v${pkgver}"

source_x86_64=("${_base_url}/termchat-linux-amd64")
source_aarch64=("${_base_url}/termchat-linux-arm64")
source_i686=("${_base_url}/termchat-linux-386")

sha256sums_x86_64=('985a984b3aac505913a9bf593febfdd25d15be0f19afd0efa3428f0111b0894a')
sha256sums_aarch64=('1f0b99f22039b6fd975b7a2435e62831d94404198f6d2f7360f1c10ce40be8b6')
sha256sums_i686=('6bea23e9635aaa21ed3a9ed091c55abf665a177397822709ed557222eba3fa48')

# Man page and license from the source repo
source=("termchat.1::https://raw.githubusercontent.com/ishaan-jindal/termchat/cli-v${pkgver}/doc/termchat.1"
        "LICENSE::https://raw.githubusercontent.com/ishaan-jindal/termchat/cli-v${pkgver}/LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
    # Determine the correct binary name for this architecture
    case "$CARCH" in
        x86_64)  _binary="termchat-linux-amd64" ;;
        aarch64) _binary="termchat-linux-arm64" ;;
        i686)    _binary="termchat-linux-386" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/termchat"
    install -Dm644 "${srcdir}/termchat.1" "${pkgdir}/usr/share/man/man1/termchat.1"
    install -Dm644 "${srcdir}/LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
