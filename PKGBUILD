# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mongoclient
pkgver=1.2.2
pkgrel=1
pkgdesc="MongoDB administration client"
arch=('i686' 'x86_64')
url="http://www.mongoclient.com/"
license=('MIT')
source=("https://raw.githubusercontent.com/rsercano/mongoclient/master/public/logo/head_3.png"
        "${pkgname}.desktop")
source_i686=("https://github.com/rsercano/mongoclient/releases/download/${pkgver}/linux-portable-x86.32-bit.zip")
source_x86_64=("https://github.com/rsercano/mongoclient/releases/download/${pkgver}/linux-portable-x64.zip")
sha256sums=("652cdc1e121a8f156ead6da7c0193bc094bfdf5da252c0dd8c6a8ce0b5ebfcd3"
            "e108b25a50b304dc96f8ec1ac54f97d2cafe126058c3430e8c9209357463d937")
sha256sums_i686=("8914165c1f3af1a00404027e9fc5ca2b98d5ea9fc2e8894dbdc64a0d5645b83a")
sha256sums_x86_64=("72023a7975bf87b037746e3dd473dcb4d1654be50acb538afcdeb4240035f2a0")
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
