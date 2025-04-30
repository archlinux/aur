# Maintainer: Sizning ismingiz <sizning_emailingiz@example.com>

pkgname=bizstaff         # Paket nomi (odatda '-bin' qo'shimchasi pre-kompilyatsiya qilinganlar uchun ishlatiladi)
pkgver=1.0.0             # Ilovangiz versiyasi (AppImage versiyasi bilan bir xil bo'lsin)
pkgrel=1                 # Paket relizi (PKGBUILD o'zgarsa, lekin ilova versiyasi o'zgarmasa, buni oshiring)
pkgdesc="Mening ajoyib Electron ilovam haqida qisqacha tavsif" # Ilova tavsifi
arch=('x86_64')          # Arxitektura (AppImage odatda x86_64 bo'ladi)
url="https://github.com/Muhiddin0/bizstaff-descktop/" # Loyiha veb-sayti yoki GitHub manzili
license=('MIT')          # Litsenziya (masalan, MIT, GPL3, etc.)
depends=('fuse2')        # AppImage ishlashi uchun kerak bo'lishi mumkin bo'lgan bog'liqliklar (fuse2 yoki fuse3 kerak bo'lishi mumkin)
optdepends=()            # Ixtiyoriy bog'liqliklar (agar bo'lsa)
provides=("${pkgname%-bin}") # Qaysi paketni ta'minlashi (masalan, 'mening-ilovam')
conflicts=("${pkgname%-bin}") # Qaysi paketlar bilan ziddiyatda bo'lishi (agar bo'lsa)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Muhiddin0/bizstaff-descktop/releases/download/v${pkgver}/Bizstaff-${pkgver}.AppImage"
        "bizstaff.desktop"     # Menyuga qo'shish uchun .desktop fayl (keyingi qadamda yaratamiz)
        "icon.png")            # Ikonka fayli (keyingi qadamda tayyorlaymiz)
sha256sums=('SKIP'             # AppImage faylining SHA256 checksumi (HOZIRCHA SKIP, keyin to'g'rilaymiz)
            'SKIP'             # .desktop faylining checksumi (HOZIRCHA SKIP)
            'SKIP')            # .png faylining checksumi (HOZIRCHA SKIP)

package() {
  # AppImage faylini /opt/ katalogiga o'rnatish (standart bo'lmagan binarlar uchun yaxshi joy)
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # /usr/bin papkasini yaratish (agar mavjud bo'lmasa)
  install -d "${pkgdir}/usr/bin"

  # /usr/bin da ishga tushirish uchun simvolik link (yoki kichik skript) yaratish
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname%-bin}" # '-bin' qismini olib tashlaymiz

  # .desktop faylini menyular uchun o'rnatish
  install -Dm644 "${srcdir}/bizstaff.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # Ikonkani o'rnatish (o'lchamni moslang, masalan 128x128)
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
}