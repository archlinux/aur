# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop-bin
_pkgname=NVM.Desktop
pkgver=4.5.0
pkgrel=1
pkgdesc="Node Version Manager Desktop - A desktop application to manage multiple active node.js versions."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/1111mp/nvm-desktop"
_nvmdurl="https://github.com/1111mp/nvmd-command"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-indicator'
	'libappindicator'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/1111mp/nvm-desktop/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.armhfp.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('29798e23122ddb11554d17646d9f90e205bdb51adc096136e0d1ee89a6279221')
sha256sums_aarch64=('7deac4d18317f76b37d7984861416b1d5b246e8f9ea89b8f2139cd6910173fc0')
sha256sums_armv7h=('f02f391a9c6bb2655759b4f0a6ec995016b6b30e2de44d3727becd6fca193603')
sha256sums_x86_64=('e5b0e9cfeb40ede07fccc6f4d9678468e149437608b53be165924399f14fcfaf')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/usr/lib/${_pkgname//./ }/resources/nvmd" -t "${pkgdir}/usr/lib/${_pkgname//./ }/resources"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname//./ }/icons/icon.png" -t "${pkgdir}/usr/lib/${_pkgname//./ }/icons"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
