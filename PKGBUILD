# Maintainer: Ahmed <ahmedalwanmunshed@gmail.com>
pkgname=zerone-ai-bin
pkgver=1.0.0
pkgrel=6
pkgdesc="ZERONE AI Desktop Application - Intelligent Chat Interface"
arch=('x86_64')
url="https://github.com/b2-3c/ZERONE-AI"
license=('ISC')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'fuse2')
options=(!strip)

# تأكد من وجود ملف zerone-ai.png و zerone-ai.desktop في نفس المجلد
source=("https://github.com/b2-3c/ZERONE-AI/releases/download/v${pkgver}/ZERONE-AI-${pkgver}.AppImage"
        "zerone-ai.desktop"
        "zerone-ai.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # 1. تثبيت ملف الـ AppImage
    install -Dm755 "${srcdir}/ZERONE-AI-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # 2. إنشاء الرابط الرمزي للتشغيل من الطرفية
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/zerone-ai"
    
    # 3. تثبيت ملف الـ Desktop الاختصار لظهوره في القائمة
    install -Dm644 "${srcdir}/zerone-ai.desktop" "${pkgdir}/usr/share/applications/zerone-ai.desktop"
    
    # 4. تثبيت الأيقونة في مسار أيقونات النظام
    install -Dm644 "${srcdir}/zerone-ai.png" "${pkgdir}/usr/share/pixmaps/zerone-ai.png"
}
