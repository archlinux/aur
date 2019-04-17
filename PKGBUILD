pkgname="google-keep-nativefier"
pkgver="0.1"
pkgrel="2"
pkgdesc="Quickly capture what's on your mind and get a reminder later at the right place or time. Speak a voice memo on the go and have it automatically transcribed."
arch=("x86_64")
license=("MIT")
url="https://keep.google.com/"
source=("${pkgname}.png" "${pkgname}.desktop")
makedepends=("nodejs" "npm" "nodejs-nativefier")
sha256sums=("SKIP" "SKIP")

instname="google-keep"

build() {
    cd "${srcdir}"

    nativefier "https://keep.google.com/" \
      --icon "${pkgname}.png" \
      --maximize \
      --internal-urls ".*" \
      --name "Google Keep"
}

package() {
  install -dm755 "${pkgdir}/opt/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"

  cp "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${instname}.desktop"
  cp "${srcdir}/${instname}-linux-x64" "${pkgdir}/opt/"

  ln -sf "/opt/${instname}-linux-x64/${instname}" "${pkgdir}/usr/bin/${instname}"
  ln -sf "/opt/${instname}-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${instname}.png"

  chmod 777 "${pkgdir}/opt/${instname}-linux-x64/resources/app/nativefier.json"
}

