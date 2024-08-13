# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>

pkgname=ftb-app-bin
pkgver=1.25.18
pkgrel=1
epoch=
pkgdesc="A new Modpack launcher for FTB and Curse modpacks."
arch=(x86_64 aarch64)
url="https://feed-the-beast.com/app"
license=("LGPL-2.1-only")
groups=()
depends=("alsa-lib" "nss" "gtk3")
makedepends=()
checkdepends=()
# FTB App will download Adoptium for itself and Minecraft, althrough system Java can be used for Minecraft too.
optdepends=("java-runtime: Playing Minecraft with system Java.")
provides=(ftb-app)
conflicts=(ftb-app)
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://piston.feed-the-beast.com/app/ftb-app-${pkgver}-amd64.deb")
source_aarch64=("https://piston.feed-the-beast.com/app/ftb-app-${pkgver}-arm64.deb")
noextract=()
sha256sums_x86_64=(c5262e1a7896d100c31b837bf226c7498bb5691ff6d0bb80141748a1d4cc4e3c)
sha256sums_aarch64=(713e0babfdaa7de9e2c0e409000c3f10c93daf071aea8771c78465f7eccc8a04)
validpgpkeys=()

package() {
  tar -xJf "$srcdir/data.tar.xz" -C "$pkgdir"

  # move "/opt/FTB Electron App" to /opt/ftb-app
  mv "$pkgdir/opt/FTB Electron App" "$pkgdir/opt/ftb-app"
  sed -i 's#/opt/FTB Electron App/ftb-app#/opt/ftb-app/ftb-app#' "$pkgdir/usr/share/applications/ftb-app.desktop"

  # prevent self-upgrade with dpkg
  rm "$pkgdir/opt/ftb-app/resources/package-type"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/ftb-app/ftb-app "$pkgdir/usr/bin/ftb-app"
}
