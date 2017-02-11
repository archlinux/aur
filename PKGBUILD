# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mongoclient
pkgver=1.5.0
pkgrel=1
pkgdesc="MongoDB administration client"
arch=('i686' 'x86_64')
url="http://www.mongoclient.com/"
license=('MIT')
source=("https://github.com/rsercano/mongoclient/releases/download/${pkgver}/linux-portable-x64.zip"
        "https://raw.githubusercontent.com/rsercano/mongoclient/master/public/logo/head_3.png"
        "${pkgname}.desktop")
sha256sums=("5e13ca5c20bbbb2b97357ed69650c2eaec1ae3e87806c49c2d897fca0456f836"
            "ac81ed24e411748e0ef12b39213ef41c8a734827eea349877f9938a0c44c3a2f"
            "e108b25a50b304dc96f8ec1ac54f97d2cafe126058c3430e8c9209357463d937")
noextract=(*.zip)

package() {
  cd "${srcdir}"

  install -Ddm755 "${pkgdir}/usr/bin/"

  msg2 "Extracting archive..."
  unzip -q "linux-portable-*.zip" -d "${pkgdir}/opt/"

  mv "${pkgdir}/opt/linux-portable-x64" "${pkgdir}/opt/${pkgname}"

  msg2 "Linking executable..."
  ln -s "/opt/${pkgname}/Mongoclient" "${pkgdir}/usr/bin/"

  install -Dm644 "head_3.png" "${pkgdir}/usr/share/${pkgname}/img/icon.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Ddm777 "${pkgdir}/opt/${pkgname}/resources/app/db"
}
