# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=7.79.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("themes-${pkgver}.zip::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/themes.zip")
source_x86_64=("posh-linux-amd64-${pkgver}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
source_armv7h=("posh-linux-arm-${pkgver}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm")
source_aarch64=("posh-linux-arm64-${pkgver}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm64")
noextract=('themes.zip')
sha256sums=('b9f5b0367e7d3f55793212011b8a5f991da7f3aa65cbda0f09535432a5d6aac0')
sha256sums_x86_64=('297d0d0b625e9eb64c0ee48a80562aa398f062ce18a1cf09588493298aeb4e99')
sha256sums_armv7h=('163d576b54362cbb765e15627fbe5342bc18d79229d5ab8deb2f7f6648b485a7')
sha256sums_aarch64=('ecb0428f73360e59cd4175e862f208fcacacdfd6fa855ef0f327e98d40f0e1d6')

pkgver() {
    curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' |
        sed 's/v//'
}

package() {
    if [[ "$CARCH" = 'x86_64' ]]; then
        install -Dm 755 "posh-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'armv7h' ]]; then
        install -Dm 755 "posh-linux-arm-${pkgver}" "${pkgdir}/usr/bin/oh-my-posh"
    elif [[ "$CARCH" = 'aarch64' ]]; then
        install -Dm 755 "posh-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/oh-my-posh"
    fi

    mkdir -p "${pkgdir}/usr/share/oh-my-posh/themes"
    unzip "${srcdir}/themes-${pkgver}.zip" -d "${pkgdir}/usr/share/oh-my-posh/themes"
}
