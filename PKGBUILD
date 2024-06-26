# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>
_projectname=electron
_major=18
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_pkgver="${_major}.3.15"
pkgver="${_pkgver/-/.}"
pkgrel=2
pkgdesc="Build cross platform desktop apps with web technologies - binary version ${_major}"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url='https://electronjs.org'
_ghurl="https://github.com/electron/electron"
license=(
    'MIT'
    'LicenseRef-custom'
)
provides=(
    "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
    'libappindicator-gtk3: StatusNotifierItem support'
    'pipewire: WebRTC desktop sharing under Wayland'
    'trash-cli: file deletion support (trash-put)'
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
source_aarch64=(
    "${_pkgname}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-arm64.zip"
    "${_pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-arm64.zip"
)
source_armv7h=(
    "${_pkgname}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-armv7l.zip"
    "${_pkgname}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-armv7l.zip"
)
source_i686=(
    "${_pkgname}-chromedriver-${pkgver}-i686.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-ia32.zip"
    "${_pkgname}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-ia32.zip"
)
source_x86_64=(
    "${_pkgname}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-x64.zip"
    "${_pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-x64.zip"
)
sha256sums_aarch64=('99b9de28ce9584c6f81d153af7db2eaf7b899d2676c71b99e6a04c1409cbc06c'
                    '8fc93d852acc6722d6c4f62a74bc62d56abacb27c2b4ab644415b73e45c2e6b5')
sha256sums_armv7h=('43d83f9f524d4bb04e5e48829aa86e1b5a78dab2dec0aa46671f4b83bdf6885b'
                   '2cc18781bdc5069878e544603fd66bccb9e8bf098f0250637cb5643cdc23d8bb')
sha256sums_i686=('23c5b474a058563f1f3959756888769e5e6594533facc578d7c96e05937e281d'
                 '1a417ec687b6591800b7123fe60207984fb686156ca3b90dfd56e4ad0c1da4aa')
sha256sums_x86_64=('49f4214317177af42e65139fb01f18f880669e67b506d7c2d8c75bd6964e9ee5'
                   '482101648dbf22e0e2c6be16cf36a9abf57028024abee56e23c143207d6ecdec')
package() {
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}/"
    find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "${pkgdir}/usr/lib/${_pkgname}/." {} +
    for _folder in 'locales' 'resources'; do
        cp -r --no-preserve=ownership --preserve=mode "${_folder}/" "${pkgdir}/usr/lib/${_pkgname}/${_folder}/"
    done
    chmod u+s "${pkgdir}/usr/lib/${_pkgname}/chrome-sandbox"
    install -dm755 "${pkgdir}/usr/bin"
    ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"
       
    for _license in 'LICENSE' 'LICENSES.chromium.html'; do
        install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    done
}