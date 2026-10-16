# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=4.0.14
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
md5sums_x86_64=('d5041d92eb051c67dd548e1b298b6445')
md5sums_aarch64=('948402b378974eab7ea78d0f895ea3c2')

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
