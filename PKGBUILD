# Maintainer: Sergey Shatunov <me@aur.rocks>

_pkgname=rubick
pkgname=${_pkgname}-kubernetes-bin
pkgver=4.3.0
pkgrel=3
pkgdesc="Modern cross-platform Kubernetes GUI client (prebuilt version)"
arch=(x86_64)
url="https://github.com/Dudude-bit/rubick"
license=('GPL-3.0-or-later')
depends=("kubectl" "cairo" "desktop-file-utils" "gdk-pixbuf2" "glib2" "gtk3" "hicolor-icon-theme" "libsoup3" "pango" "webkit2gtk-4.1")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
_assets_ref=81809b080d05e6e890ee642bff848611ebf79242
source=(
	"com.k8s-gui.app.desktop"
	"rubick-icon-256.png::https://github.com/Dudude-bit/rubick/raw/${_assets_ref}/src-tauri/icons/256x256.png"
	"rubick-icon-128.png::https://github.com/Dudude-bit/rubick/raw/${_assets_ref}/src-tauri/icons/128x128.png"
	"rubick-icon-64.png::https://github.com/Dudude-bit/rubick/raw/${_assets_ref}/src-tauri/icons/64x64.png"
	"rubick-icon-32.png::https://github.com/Dudude-bit/rubick/raw/${_assets_ref}/src-tauri/icons/32x32.png"
	"rubick-icon.svg::https://github.com/Dudude-bit/rubick/raw/${_assets_ref}/src-tauri/icons/icon.svg"
)
source_x86_64=(
	"${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Rubick_${pkgver}_amd64.deb"
)
sha256sums=('82f31d2a4c5fa49a3e7c52378c94fe16a62e3adb0082eed9cd9f2787849deb00'
            '1d9e24df0cf8c8d2342fe21ffa92b62e8a63d4da65bdea34541e55ff5777fe87'
            'bde347be32bd9d64997923194a760f309efd686e0ae8a34dee7c91c30cc61366'
            'ef223b31d2c4f2a3cef9bed6132bb60fe5091df6909dd513d8696cbba6012035'
            '3885ea939b7b56f116c2772b70b1ec543025b7716973df06aade0d2037a239ef'
            'a238fa258d9d49cfe0baaa019dd05743bdb39c820032b1d8d8f074bc31ab4b20')
sha256sums_x86_64=('19399222187ce4f04f28139493f82a118b5a89979b457c0770585333ffdf80b5')

prepare() {
	tar -zxf data.tar.gz usr/bin/Rubick
}

package() {
	install -Dm755 usr/bin/Rubick "${pkgdir}/usr/bin/rubick"
	install -Dm755 "${srcdir}/com.k8s-gui.app.desktop" "${pkgdir}/usr/share/applications/com.k8s-gui.app.desktop"
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 32 64 128 256; do
		install -Dm644 "${srcdir}/rubick-icon-${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/com.k8s-gui.app.png"
	done
	install -Dm644 "${srcdir}/rubick-icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.k8s-gui.app.svg"
}
