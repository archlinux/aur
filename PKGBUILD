# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=3.12.2
pkgrel=1
pkgdesc="A cross-platform desktop All-in-One assistant tool for Claude Code, Codex & Gemini CLI."
arch=('x86_64' 'aarch64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
source_x86_64=("CC-Switch-v${pkgver}-Linux-x86_64.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux-x86_64.deb")
source_aarch64=("CC-Switch-v${pkgver}-Linux-arm64.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux-arm64.deb")
md5sums_x86_64=('576037d408cfe38174bf8c0e786ac587')
md5sums_aarch64=('77b8c0036ecc0406c7ad17917d87502d')

package() {
    local _debfile
    if [[ "$CARCH" == "x86_64" ]]; then
        _debfile="CC-Switch-v${pkgver}-Linux-x86_64.deb"
    else
        _debfile="CC-Switch-v${pkgver}-Linux-arm64.deb"
    fi

    # Extract the deb package
    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
