# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=floral-notepaper-bin
_pkgname='Floral Notepaper'
_zhsname='花笺'
pkgver=1.1.0
pkgrel=1
pkgdesc="A lightweight, elegant, and modern sticky note app for your desktop.(Prebuilt version)轻量、优雅、现代化的本地便签工具"
arch=('x86_64')
url="https://github.com/Achilng/floral-notepaper"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Achilng/floral-notepaper/v${pkgver}/LICENSE"
)
sha256sums=('bac5e6e239bc42aa7192dafbaf70c9b97ed995db3e2084345a7160b14b70cd95'
            'e4df1e97f2ee75fe597e567546bf3070f5b09c9cc4879666b53fe5254e00994e')
prepare() {
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
