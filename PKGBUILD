# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mongoclient
pkgver=1.4.0
pkgrel=1
pkgdesc="MongoDB administration client"
arch=('i686' 'x86_64')
url="http://www.mongoclient.com/"
license=('MIT')
source=("https://github.com/rsercano/mongoclient/releases/download/${pkgver}/linux-portable-x64.zip"
        "https://raw.githubusercontent.com/rsercano/mongoclient/master/public/logo/head_3.png"
        "${pkgname}.desktop")
sha256sums=("3a35d3be9046f62bdd281efa5b2e88047cff16ef83aad8aee3e79c49b6164a0e"
            "652cdc1e121a8f156ead6da7c0193bc094bfdf5da252c0dd8c6a8ce0b5ebfcd3"
            "e108b25a50b304dc96f8ec1ac54f97d2cafe126058c3430e8c9209357463d937")
noextract=(*.zip)

package() {
  cd "${srcdir}"

  install -Ddm755 "${pkgdir}/usr/bin/"

  msg2 "Extracting archive..."
  unzip -q "linux-portable-*.zip" -d "${pkgdir}/opt/"

  if [[ "$CARCH" = "i686" ]]; then
    mv "${pkgdir}/opt/Mongoclient-linux-ia32" "${pkgdir}/opt/${pkgname}"
  else
    mv "${pkgdir}/opt/Mongoclient-linux-x64" "${pkgdir}/opt/${pkgname}"
  fi

  msg2 "Linking executable..."
  ln -s "/opt/${pkgname}/Mongoclient" "${pkgdir}/usr/bin/"

  install -Dm644 "head_3.png" "${pkgdir}/usr/share/${pkgname}/img/icon.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Ddm777 "${pkgdir}/opt/${pkgname}/resources/app/db"
}
