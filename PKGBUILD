pkgname="ms-office-online-nativefier"
pkgver="0.1"
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
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"

  cp -rf "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/microsoft-office-online.desktop"
  cp -rf "${srcdir}/microsoft-office-online-linux-x64" "${pkgdir}/opt/"

  ln -sf "/opt/microsoft-office-online-linux-x64/microsoft-office-online" "${pkgdir}/usr/bin/microsoft-office-online"
  ln -sf "/opt/microsoft-office-online-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/microsoft-office-online.png"

  chmod 777 "${pkgdir}/opt/microsoft-office-online-linux-x64/resources/app/nativefier.json"
}

