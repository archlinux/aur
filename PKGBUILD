# created by GPT
# Maintainer: Recolic K <root@recolic.net>
# Original repo: https://github.com/AzureAD/microsoft-authentication-cli

pkgname=microsoft-authentication-cli-bin
pkgver=0.9.8
pkgrel=1
pkgdesc='Command-line utility for Microsoft Entra authentication (AzureAuth)'
arch=('x86_64' 'aarch64')
url='https://github.com/AzureAD/microsoft-authentication-cli'
license=('MIT')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'icu' 'krb5' 'openssl' 'zlib')
optdepends=('xdg-utils: open the browser for interactive authentication')
provides=('azureauth')
conflicts=('azureauth')
options=('!strip')

_deb_x64="azureauth-${pkgver}-linux-x64.deb"
_deb_arm64="azureauth-${pkgver}-linux-arm64.deb"
source_x86_64=("${url}/releases/download/${pkgver}/${_deb_x64}")
source_aarch64=("${url}/releases/download/${pkgver}/${_deb_arm64}")
noextract=("${_deb_x64}" "${_deb_arm64}")
sha256sums_x86_64=('dbc002debe53f48ef2fd801b333f1ca454ee89f8d59980bad642884750b466cf')
sha256sums_aarch64=('aa8d27cab7032f4cb6934a3a9dabcc9af50bca4617ef8c72c0e11c278ad6809e')

package() {
    local deb="${_deb_x64}"
    if [[ $CARCH == aarch64 ]]; then
        deb="${_deb_arm64}"
    fi
    bsdtar -xOf "$deb" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"
}
