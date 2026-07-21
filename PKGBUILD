# Maintainer: Zaid Ajo <zaidejjodev@gmail.com> [cite: 1]

pkgname=omniapi-desktop-bin 
pkgver=1.0.10
pkgrel=1
pkgdesc="Blazing-fast API client — desktop GUI"
arch=('x86_64') 
url="https://github.com/zaidejjo/omniapi" 
license=('MIT') 
depends=(
  'gtk3' 
  'webkit2gtk-4.1' 
)
optdepends=('libappindicator-gtk3: tray icon') 

# Tauri Linux Package — .deb
source=(
  "${url}/releases/download/v${pkgver}/omniapi_${pkgver}_amd64.deb"
  "https://raw.githubusercontent.com/zaidejjo/omniapi/v${pkgver}/README.md" 
  "https://raw.githubusercontent.com/zaidejjo/omniapi/v${pkgver}/LICENSE" 
)
sha256sums=('71622bfc9c0b3386c775bdc9a44bed1696abcc238e6c3526bd2b0c033818c2d4')

package() {
  # 1. فك ضغط ملف الـ deb في مجلد البناء
  ar x "${srcdir}/omniapi_${pkgver}_amd64.deb"

  # 2. استخراج المجلدات الجاهزة للنظام (/usr/bin, /usr/share ...)
  tar -xf data.tar.* -C "${pkgdir}"

  # 3. تثبيت ملفات التوثيق والترخيص
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" [cite: 5]
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md" [cite: 5]
}