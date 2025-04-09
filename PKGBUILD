# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: yurikoles <root at yurikoles dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname=electron
_major=3
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver='1.13'
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=9
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
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
	'libxss'
)
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
    'pipewire: WebRTC desktop sharing under Wayland'
    'trash-cli: file deletion support (trash-put)'
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
noextract=(
	"${_pkgname}-chromedriver-${pkgver}-${CARCH}.zip"
	"${_pkgname}-${pkgver}-${CARCH}.zip"
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
sha256sums_aarch64=('e07b521b78bf1b8a798cf182da7d69addd4df14be1ba1b94f6ac2b8def0eb64d'
                    'a81f64005de996950219b9da38f0c9299fb519a6f7a7b7c38868cd066c3fec8e')
sha256sums_armv7h=('65a40ac17514b921565c5735d020dcad19320c08743b8a57ce59e869cb76763e'
                   '4a6f2dcb8d6055c15b2fb416a9172da9f1666147ab82a5b8448177112413fadf')
sha256sums_i686=('03eea93b7a741c53de4d70a6d0aad817e76077ee607c3e5799ea88f8548b9116'
                 '43b046768e6189794097a8e11e81d305a9c3586685b2ac88b3e44a452ecb2012')
sha256sums_x86_64=('aaaa85c1e3b83b0c9c4337e8a8fd46fcae7be3a00c7bb8ca5dc48169c88e34f8'
                   '33ab34af83bd1063fb1581ad0fed6dc1120b6b5d1dba0a8db3164af3e95d55df')
prepare() {
    install -Dm755 -d "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/${_pkgname}-chromedriver-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    rm -rf "${srcdir}/${_pkgname}/"{gen,chromedriver.debug}
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib"
    ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}