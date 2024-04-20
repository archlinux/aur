# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba
pkgver=1.25.8
pkgrel=1
epoch=1
url="https://feed-the-beast.com/app"
arch=(x86_64 aarch64)
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source_x86_64=("https://piston.feed-the-beast.com/app/ftb-app-${pkgver}-amd64.deb")
source_aarch64=("https://piston.feed-the-beast.com/app/ftb-app-${pkgver}-arm64.deb")
sha256sums_x86_64=(5c304798857e3bc584a8762d85be84fbac812c157fac863de1c9bf20566fb013)
sha256sums_aarch64=(072d7d46c0cf7580f344dd03838744a74d097cbcaafaac0d9b5f642de62c3f4b)
license=("LGPL2.1")
depends=("alsa-lib" "nss" "gtk3")
# FTBA will download Adoptium for itself and Minecraft, although system Java can be used for Minecraft too.
optdepends=("java-runtime: Playing Minecraft with system Java.")

package() {
  tar -xJf "$srcdir/data.tar.xz" -C "$pkgdir"

  # move "/opt/FTB Electron App" to /usr/lib/ftb-app
  install -d "$pkgdir/usr/lib"
  mv "$pkgdir/opt/FTB Electron App" "$pkgdir/usr/lib/ftb-app"
  rmdir "$pkgdir/opt"
  sed -i 's#/opt/FTB Electron App/ftb-app#/usr/lib/ftb-app/ftb-app#' "$pkgdir/usr/share/applications/ftb-app.desktop"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/ftb-app/ftb-app "$pkgdir/usr/bin/ftb-app"
}
