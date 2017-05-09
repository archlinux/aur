# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mongoclient
pkgver=2.0.0
pkgrel=1
pkgdesc="MongoDB administration client"
arch=('i686' 'x86_64')
url="http://www.mongoclient.com/"
license=('MIT')
source=("https://github.com/rsercano/mongoclient/releases/download/${pkgver}/linux-portable-x64.zip"
        "https://raw.githubusercontent.com/rsercano/mongoclient/master/public/logo/new/image_only.png"
        "${pkgname}.desktop")
sha256sums=("2d9158e407bd7bbb776bb0c8aa3e330348135616c8bd24143fd9142eb2261b2e"
            "576f36bc7c797f9ccc7695035016885824f13cc92a6ac9b95dc70bdc0a1cc637"
            "e108b25a50b304dc96f8ec1ac54f97d2cafe126058c3430e8c9209357463d937")
noextract=(*.zip)

package() {
  cd "${srcdir}"

  install -Ddm755 "${pkgdir}/usr/bin/"

  msg2 "Extracting archive..."
  mkdir -p "${pkgdir}/opt/${pkgname}"
  unzip -q "linux-portable-*.zip" -d "${pkgdir}/opt/${pkgname}"

  #mv "${pkgdir}/opt/linux-portable-x64" "${pkgdir}/opt/${pkgname}"

  msg2 "Linking executable..."
  ln -s "/opt/${pkgname}/Mongoclient" "${pkgdir}/usr/bin/"

  install -Dm644 "image_only.png" "${pkgdir}/usr/share/${pkgname}/img/icon.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Ddm777 "${pkgdir}/opt/${pkgname}/resources/app/db"
}
