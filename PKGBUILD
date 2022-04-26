# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=7.72.4
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/themes.zip")
source_x86_64=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
source_armv7h=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm")
source_aarch64=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm64")
noextract=('themes.zip')
sha256sums=('61c76c97404d0eb4bc310ad5bd19648d67118b6ef6aa478fcf5101009d0629c4')
sha256sums_x86_64=('46d2d0bf64c341863a1444e89222269a78afacd65e421b8ea7ee870c5392a17c')
sha256sums_armv7h=('54450006d44f87fc367f252f8919cae92dd945970ea82e60a44f19e0c8b283e6')
sha256sums_aarch64=('2a5102cad808d8fd768d62a12415b70ba1f72ced96fceab7af0e0414493c9c0e')

pkgver() {
    curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' |
        sed 's/v//'
}

package() {
    if [[ "$CARCH" = 'x86_64' ]]; then
        install -Dm 755 posh-linux-amd64 "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'armv7h' ]]; then
        install -Dm 755 posh-linux-arm "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'aarch64' ]]; then
        install -Dm 755 posh-linux-arm64 "${pkgdir}/usr/bin/oh-my-posh"
    fi

    mkdir -p "${pkgdir}/usr/share/oh-my-posh/themes"
    unzip "${srcdir}/themes.zip" -d "${pkgdir}/usr/share/oh-my-posh/themes"
}
