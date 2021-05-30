# Maintainer: Leonid Ezersky <leonidez // protonmail // ch>

pkgname=thr-editor
pkgver=1.1.0
pkgrel=1
pkgdesc='Control Yamaha THR5, THR5A, THR10, THR10C, and THR10X guitar amplifiers.'
arch=('x86_64')
url='https://usa.yamaha.com/support/updates/57648_en.html'
license=('custom')
depends=('wine')
makedepends=('icoutils' 'p7zip')
source=('https://usa.yamaha.com/files/download/software/6/312346/THR_Editor_V110_Win.zip'
        "${pkgname}.desktop"
        "${pkgname}.xml"
        "${pkgname}")
sha256sums=('3620f0f8f25efa33e3f6fd85b79718153bc4ccb181ff681f20f925561e07d1cd'
            '23a29c602cd89f2cf8f195d8c735384d57225b538ba4852687641d367e473c3b'
            '2f8759a7a02e6f4851cbedd2be3a8a3b9d8cd62636984a3ff6788fed6aa5dcf3'
            'dd5707fc26aa4646be2497dc8baff0009516cd0f625cb5cf9c0cae39773b1617')

package() {
  # Extract exe and icons.
  7z x -y "${srcdir}/THR_Editor_V110_Win/THR_EditorSetup.msi" -o"${srcdir}" > /dev/null
  7z x -y "${srcdir}/_D8A8E73D9373CDC98EC4D665B04B27E3" -o"${srcdir}" > /dev/null
  # Extract 256x256 app icon from exe.
  wrestool --extract --output="${srcdir}" --raw --type=3 --name=4 _F5E59C5FEACB4570982624661AB8D0EE
  # Extract smaller icons from ico files for app, YDP and YDL.
  # After extraction, icotool exits with error "libpng error: IHDR: CRC error",
  # so piping to true to prevent failing package.
  icotool --extract --output="${srcdir}" Icon._8CD22ED9F731E9CA8249AF.exe 2> /dev/null || true
  icotool --extract --output="${srcdir}" Icon._6FEFF9B68218417F98F549.exe 2> /dev/null || true
  icotool --extract --output="${srcdir}" Icon._21F3885A18D238E15AAE81.exe 2> /dev/null || true
  # App files.
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "${srcdir}/_F5E59C5FEACB4570982624661AB8D0EE" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
  # App icon.
  install -Dm644 "${srcdir}/Icon._8CD22ED9F731E9CA8249AF.exe_3_16x16x8.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/Icon._8CD22ED9F731E9CA8249AF.exe_2_32x32x8.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/Icon._8CD22ED9F731E9CA8249AF.exe_1_48x48x8.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/_F5E59C5FEACB4570982624661AB8D0EE_3_4_1041" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  # YDL icon.
  install -Dm644 "${srcdir}/Icon._6FEFF9B68218417F98F549.exe_3_16x16x8.png" "${pkgdir}/usr/share/icons/hicolor/16x16/mimetypes/${pkgname}-ydl.png"
  install -Dm644 "${srcdir}/Icon._6FEFF9B68218417F98F549.exe_2_32x32x8.png" "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/${pkgname}-ydl.png"
  install -Dm644 "${srcdir}/Icon._6FEFF9B68218417F98F549.exe_1_48x48x8.png" "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/${pkgname}-ydl.png"
  # YDP icon.
  install -Dm644 "${srcdir}/Icon._21F3885A18D238E15AAE81.exe_3_16x16x8.png" "${pkgdir}/usr/share/icons/hicolor/16x16/mimetypes/${pkgname}-ydp.png"
  install -Dm644 "${srcdir}/Icon._21F3885A18D238E15AAE81.exe_2_32x32x8.png" "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/${pkgname}-ydp.png"
  install -Dm644 "${srcdir}/Icon._21F3885A18D238E15AAE81.exe_1_48x48x8.png" "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/${pkgname}-ydp.png"
}

