# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=4.0.29
pkgrel=1
pkgdesc="A cross-platform desktop All-in-One assistant tool for Claude Code, Codex & Gemini CLI."
arch=('x86_64' 'aarch64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
provides=('cc-switch')
conflicts=('cc-switch')
options=('!strip' '!debug')
source_x86_64=("CC-Switch-v${pkgver}-Linux-x86_64.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux-x86_64.deb")
source_aarch64=("CC-Switch-v${pkgver}-Linux-arm64.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux-arm64.deb")
md5sums_x86_64=('62e4740f4d308a30fc332cb13baabadc')
md5sums_aarch64=('b0e9dfa7fb70e1a0df544b57a9cc6047')

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
