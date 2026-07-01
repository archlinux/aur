# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rename-photos-bin
_pkgname='Rename Photos'
pkgver=1.0.2
pkgrel=1
pkgdesc="Bulk rename photos using EXIF data 🐶 (Prebuilt version)使用 EXIF 数据批量重命名照片."
arch=('x86_64')
url="https://arman19941113.github.io/rename-photos/"
_ghurl="https://github.com/Arman19941113/rename-photos"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Arman19941113/rename-photos/v${pkgver}/LICENSE"
)
sha256sums=('a19f687b0060b21dabaf94b58fa2d7d611670b11f8157514ca4ebf1500cdba84'
            '5ad2df4d8f7256a87d9d21c5a8568a8d1d6ff63e8506f87c683612bee4877c07')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
