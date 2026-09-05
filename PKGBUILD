# Maintainer: Ishaan Jindal <github.com/ishaan-jindal>

pkgname=ishaans-termchat-bin
_pkgname=termchat
pkgver=2.3.0
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

sha256sums_x86_64=('e9bc87bb85121afab99a1f1f7b63da2bea41d0540906e654f0a2aa2854b63012')
sha256sums_aarch64=('5d5618ec0c89ccc7ec0bb2b05afdaf6abfa2765a75ff8c4a1948e5a09df8e858')
sha256sums_i686=('1f5427608556ad55f71bbbb9e8961044ad87e7847207bc322fe7dc667363c643')

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
