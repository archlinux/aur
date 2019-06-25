pkgname="google-keep-nativefier"
pkgver="0.2"
pkgrel="1"
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
      --internal-urls "(accounts|calendar)\.google" \
      --name "Google Keep"
}

package() {
  install -dm644 "$pkgdir/opt/"
  install -dm644 "$pkgdir/usr/bin"
  install -dm644 "$pkgdir/usr/share/pixmaps"
  install -dm644 "$pkgdir/usr/share/applications"

  install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$instname.desktop"
  cp -rL "$srcdir/$instname-linux-"* "$pkgdir/opt/$pkgname"

  ln -sf "/opt/$pkgname/$instname" "$pkgdir/usr/bin/$instname"
  ln -sf "/opt/$pkgname/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$instname.png"

  chmod 777 "$pkgdir/opt/$pkgname/resources/app/nativefier.json"
}

