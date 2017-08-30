# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mongoclient
pkgver=2.2.0
pkgrel=1
pkgdesc="MongoDB administration client"
arch=('i686' 'x86_64')
url="https://www.nosqlclient.com/"
license=('MIT')
source=("https://github.com/nosqlclient/nosqlclient/releases/download/${pkgver}/linux-portable-x64.zip"
        "https://github.com/nosqlclient/nosqlclient/raw/master/public/logo/new/image_only.png"
        "nosqlclient.desktop")
sha256sums=("126dee94f9a8fe871581a1fe9e1874d59d2a9a07c4bb7550fd4a84137ee66c8c"
            "576f36bc7c797f9ccc7695035016885824f13cc92a6ac9b95dc70bdc0a1cc637"
            "1956e5d6b14e03e96488232e7b5c2996bf945ac1e80a0889ce20f0cf36ec39f1")
noextract=(*.zip)

package() {
  cd "${srcdir}"

  install -Ddm755 "${pkgdir}/usr/bin/"

  msg2 "Extracting archive..."
  mkdir -p "${pkgdir}/opt/${pkgname}"
  unzip -q "linux-portable-*.zip" -d "${pkgdir}/opt/${pkgname}"

  msg2 "Linking executable..."
  ln -s "/opt/${pkgname}/Nosqlclient-linux-x64/Nosqlclient" "${pkgdir}/usr/bin/"

  install -Dm644 "image_only.png" "${pkgdir}/usr/share/${pkgname}/img/icon.png"
  install -Dm644 "nosqlclient.desktop" "${pkgdir}/usr/share/applications/nosqlclient.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/Nosqlclient-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Ddm777 "${pkgdir}/opt/${pkgname}/resources/app/db"
}
