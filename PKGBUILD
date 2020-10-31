# Maintainer: robertfoster

pkgname=iortcw-venom-mod
pkgver=6.5.6
pkgrel=1
pkgdesc="Venom Mod is a general improvement of original Rtcw game, with a new challenging and aggressive AI and some exploitation of features of id tech 3 engine, keeping the original gameplay"
arch=(any)
url="https://www.moddb.com/mods/rtcw-venom-mod"
license=('CUSTOM')
depends=('iortcw-data')
makedepends=('unzip')
noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://www.moddb.com/downloads/mirror/173653/119/c90d40bdbeea743b5f31f401391f3ce4")

prepare() {
  # Unzipping with flattened paths
  unzip -jo $pkgname-$pkgver.zip -d paks
}

package() {
  cd "$srcdir"/paks
  find . -iname "*.pk3" -exec install -Dm644 {} "$pkgdir/opt/iortcw/Venom\ Mod/"{} \;
  install -Dm644 autoexec.cfg "$pkgdir/opt/iortcw/Venom\ Mod/autoexec.cfg"
  # RealRTCW compatibility
  mkdir -p "$pkgdir/opt/realrtcw"
  ln -sr /opt/iortcw/Venom\ Mod "$pkgdir/opt/realrtcw/Venom\ Mod"
}

md5sums=('1eb9a668b79d3d3a675eb57af192e283')
