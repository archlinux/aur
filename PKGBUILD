pkgname="ms-office-online-nativefier"
pkgver="0.2"
pkgrel="1"
pkgdesc="Microsoft Office Online is an Office suite that is offered as a free web application and is part of the Microsoft Office family."
arch=("x86_64")
license=("MIT")
url="https://github.com/jiahaog/nativefier"
source=("${pkgname}.png" "${pkgname}.desktop")
makedepends=("nodejs" "npm" "nodejs-nativefier")
sha256sums=("SKIP" "SKIP")

build() {
    cd "${srcdir}"

    nativefier "https://www.office.com" \
      --icon "${pkgname}.png" \
      --maximize \
      --internal-urls ".*" \
      --name "Microsoft Office Online"
}

package() {
  install -dm755 "${pkgdir}/opt/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/pixmaps"
  install -dm644 "${pkgdir}/usr/share/applications"

  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  cp -rL "${srcdir}/MicrosoftOfficeOnline-linux-x64" "${pkgdir}/opt/${pkgname}"

  ln -sf "/opt/${pkgname}/MicrosoftOfficeOnline" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/opt/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/MicrosoftOfficeOnline.png"

  chmod 777 "${pkgdir}/opt/${pkgname}/resources/app/nativefier.json"
}

