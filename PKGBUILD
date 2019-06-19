pkgname="google-calendar-nativefier"
pkgver="0.3"
pkgrel="1"
pkgdesc="The Google Calendar app helps you spend less time managing your schedule and more time enjoying it."
arch=("x86_64")
license=("MIT")
url="https://calendar.google.com/"
source=("${pkgname}.png" "${pkgname}.desktop")
makedepends=("nodejs" "npm" "nodejs-nativefier")
sha256sums=("SKIP" "SKIP")

instname="google-calendar"

build() {
    cd "${srcdir}"

    nativefier "https://calendar.google.com/" \
      --icon "${pkgname}.png" \
      --maximize \
      --internal-urls "^a" \
      --name "Google Calendar"
}

package() {
  install -dm644 "$pkgdir/opt/"
  install -dm644 "$pkgdir/usr/bin"
  install -dm644 "$pkgdir/usr/share/pixmaps"
  install -dm644 "$pkgdir/usr/share/applications"

  install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$instname.desktop"
  cp -rL "$srcdir/$instname-linux-"* "$pkgdir/opt/$pkgname"

  ln -sf "/opt/$pkgname/$instname" "$pkgdir/usr/bin/$instname"
  ln -sf "/opt/$pkgname/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  chmod 777 "$pkgdir/opt/$pkgname/resources/app/nativefier.json"
}

