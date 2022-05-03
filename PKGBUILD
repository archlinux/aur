# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=7.77.0
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
sha256sums=('d2bfb814099553ca09b43b7d9a426b2c0ac580a6d7bc25cdbda1ac10204f4fde')
sha256sums_x86_64=('750ca2ee8f1a0506a6d67750834ee97b898bda1b1bb7a34eae6f2e06de2f97f7')
sha256sums_armv7h=('5802cd7e2a8cfe79f9b88fd98411cfba4b54518bcf1efbb7a5e66868e8e71531')
sha256sums_aarch64=('a3d2cba2b367c7e2b0e69d23d0f8707309d827e5a780b65a2ac2f7c221d44027')

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
