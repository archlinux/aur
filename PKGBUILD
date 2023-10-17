# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba-electron
pkgver=202310071959_918caed003
pkgrel=1
url="https://feed-the-beast.com/app"
# launcher_*.jar contains libjnidispatch.so for x86, x86_64, s390x, riscv64, ppc64le, ppc, mips64el, arm, armel and aarch64.
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community. (Use system Electron)"
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb"
        "ftb-app.desktop"
        "ftb-app")
sha256sums=("d795701bc1481e9e5797cd4e4026e01cb7e6f79990244483e366eb125e983180"
            "2b50da4dc2811b175e5602e91dfe18e981cba3e2e80deccb8f12b59776d8c530"
            "79fd5651f4994d98c6f48a91ccf8eae316c8ee21cd30e02bfe58202cf48aecf3")
license=("LGPL2.1")
depends=("java-runtime=17" "electron22")
# FTBA will download Adoptium for Minecraft, although system Java can be used too.
optdepends=("java-runtime=11: For playing some version of Minecraft with system Java."
            "java-runtime=8: For playing some version of Minecraft with system Java.")
provides=("ftba")
conflicts=("ftba")

package() {
  tar -xzf data.tar.gz

  _jar="launcher-${pkgver//_/-}-all.jar"
  install -Dm644 "$srcdir/opt/FTBA/$_jar" "$pkgdir/usr/lib/ftb-app/$_jar"
  install -Dm755 "$srcdir/opt/FTBA/FTBApp" "$pkgdir/usr/lib/ftb-app/ftb-app"
  cp -r "$srcdir/opt/FTBA/.install4j" "$pkgdir/usr/lib/ftb-app/.install4j"
  install -Dm755 "$srcdir/ftb-app" "$pkgdir/usr/lib/ftb-app/bin/ftb-app"
  install -Dm644 "$srcdir/opt/FTBA/bin/resources/app.asar" "$pkgdir/usr/lib/ftb-app/bin/app.asar"

  install -Dm644 "$srcdir/ftb-app.desktop" "$pkgdir/usr/share/applications/ftb-app.desktop"
  install -Dm644 "$srcdir/opt/FTBA/.install4j/FTBApp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ftb-app.png"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/ftb-app/ftb-app" "$pkgdir/usr/bin/ftb-app"
}
