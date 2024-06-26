# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_major=9
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver="4.4"
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=2
pkgdesc="Build cross platform desktop apps with web technologies - version ${_major} - binary version"
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
sha256sums_aarch64=('4250345b1fffe6705fb7cd54e830d2db08c4bc8cd5526ff03aaca87764874c61'
                    'f1145e9a1feb5f2955e5f5565962423ac3c52ffe45ccc3b96c6ca485fa35bf27')
sha256sums_armv7h=('6de37fdd871f3ed26d997f5d3011d5a4da9c9abf2499bd2214243077eae2588f'
                   '2dfe3e21d30526688cc3d3215d06dfddca597a2cb62ff0c9d0d5f33d3e464a33')
sha256sums_i686=('afc038b4416c55f15fb21391291d6c1fd82cd3eb0414f96850c993a33dcf5577'
                 '40e37f8f908a81c9fac1073fe22309cd6df2d68e685f83274c6d2f0959004187')
sha256sums_x86_64=('b9e77068a7c29b3fb4897c7ab982851c15a6f29d11604c36feaed6db7b93f8c8'
                   '781d6ca834d415c71078e1c2c198faba926d6fce19e31448bbf4450869135450')
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