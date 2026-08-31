# Maintainer: Sergey Shatunov <me@aur.rocks>

_pkgname=rubick
pkgname=${_pkgname}-kubernetes-bin
pkgver=4.7.3
pkgrel=1
pkgdesc="Modern cross-platform Kubernetes GUI client (prebuilt version)"
arch=(x86_64)
url="https://github.com/Dudude-bit/rubick"
license=('GPL-3.0-or-later')
depends=("kubectl" "cairo" "desktop-file-utils" "gdk-pixbuf2" "glib2" "gtk3" "hicolor-icon-theme" "libsoup3" "pango" "webkit2gtk-4.1")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"com.k8s-gui.app.desktop"
	"${_pkgname}-256.png::${url}/raw/refs/tags/v${pkgver}/src-tauri/icons/128x128@2x.png"
	"${_pkgname}-128.png::${url}/raw/refs/tags/v${pkgver}/src-tauri/icons/128x128.png"
	"${_pkgname}-64.png::${url}/raw/refs/tags/v${pkgver}/src-tauri/icons/64x64.png"
	"${_pkgname}-32.png::${url}/raw/refs/tags/v${pkgver}/src-tauri/icons/32x32.png"
	"${_pkgname}.svg::${url}/raw/refs/tags/v${pkgver}/src-tauri/icons/icon.svg"
)
source_x86_64=(
	"${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Rubick_${pkgver}_amd64.deb"
)
sha256sums=('82f31d2a4c5fa49a3e7c52378c94fe16a62e3adb0082eed9cd9f2787849deb00'
            '511b489f87f2e219df1ae0388fb0cd4dde3a9ad3f2e241fb4dbf251512b5221c'
            'bde347be32bd9d64997923194a760f309efd686e0ae8a34dee7c91c30cc61366'
            'ef223b31d2c4f2a3cef9bed6132bb60fe5091df6909dd513d8696cbba6012035'
            '3885ea939b7b56f116c2772b70b1ec543025b7716973df06aade0d2037a239ef'
            'a238fa258d9d49cfe0baaa019dd05743bdb39c820032b1d8d8f074bc31ab4b20')
sha256sums_x86_64=('b7435a0d4ae22974cc420a14fe9fed080a6957bb39c520db045250e99e31305f')

prepare() {
	tar -zxf data.tar.gz usr/bin/Rubick
}

package() {
	install -Dm755 usr/bin/Rubick "${pkgdir}/usr/bin/rubick"
	install -Dm755 "${srcdir}/com.k8s-gui.app.desktop" "${pkgdir}/usr/share/applications/com.k8s-gui.app.desktop"
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 32 64 128 256; do
		install -Dm644 "${srcdir}/${_pkgname}-${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/com.k8s-gui.app.png"
	done
	install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.k8s-gui.app.svg"
}
