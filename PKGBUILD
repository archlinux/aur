# Maintainer: Ishaan Jindal <github.com/ishaan-jindal>

pkgname=ishaans-termchat-bin
_pkgname=termchat
pkgver=1.0.0
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

sha256sums_x86_64=('7756b619d013652ad44b7be5318a41ffec13940ae45cad0b36a01fa7a97a5659')
sha256sums_aarch64=('91ae0248636719b85da86f13b9b4c4ebecc75704a7ebf21bd4c361b9fbfe412e')
sha256sums_i686=('9042a59e5d0e6f414f937c36903347d1c8a5fd2454c8edbc1d5243b400621e39')

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
