pkgname="google-keep-nativefier"
pkgver="0.1"
pkgrel="3"
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
  cd $pkgdir

  install -dm755 "opt/"
  install -dm755 "usr/bin"
  install -dm755 "usr/share/pixmaps"
  install -dm755 "usr/share/applications"

  install -m644 "$srcdir/$pkgname.desktop" "usr/share/applications/${instname}.desktop"
  install -m644 "$srcdir/$instname-linux-x64" "opt/"

  ln -sf "/opt/${instname}-linux-x64/${instname}" "usr/bin/${instname}"
  ln -sf "/opt/${instname}-linux-x64/resources/app/icon.png" "usr/share/pixmaps/${instname}.png"

  chmod 777 "opt/${instname}-linux-x64/resources/app/nativefier.json"
}

