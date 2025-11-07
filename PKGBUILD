# 5Maintainer: Nararinyan <smileface151211@gmail.com>
pkgname=fractioncalc-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple calculator for fractions."
arch=('x86_64')
url="https://github.com/Ashyraffa32/FractionCalc"
license=('GPL') # <-- VERIFY THIS LICENSE ON THE REPO!
provides=('fractioncalc')
conflicts=('fractioncalc')

# This uses the official download link you provided
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Ashyraffa32/FractionCalc/releases/download/v${pkgver}/FractionCalc-${pkgver}.AppImage"
              "fractioncalc.desktop" # <-- REPLACE WITH ACTUAL PATH IN REPO
              "fractioncalc.png")    # <-- REPLACE WITH ACTUAL PATH IN REPO

# CRITICAL: Get this hash from the file itself!
sha256sums_x86_64=('8c8ed586df3ddb896035d9078fbc77b33809370f1574fd5d582062bfe395b123'
                  'SKIP' # Checksum for .desktop file
                  'SKIP') # Checksum for icon file

package() {
  # 1. Install the AppImage file to /opt/
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/FractionCalc.AppImage"

  # 2. Create a wrapper script in /usr/bin/ to launch the AppImage
  install -Dm755 /dev/null "${pkgdir}/usr/bin/${pkgname%-bin}"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname%-bin}"
  echo "/opt/${pkgname}/FractionCalc.AppImage \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname%-bin}"

  # 3. Install the .desktop file (for the menu)
  # Ensure the .desktop file points to the wrapper script: /usr/bin/fractioncalc
  install -Dm644 "${srcdir}/fractioncalc.desktop" \
    "${pkgdir}/usr/share/applications/fractioncalc.desktop"

  # 4. Install the icon
  install -Dm644 "${srcdir}/fractioncalc.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/fractioncalc.png"
}
