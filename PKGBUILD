# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=harmonyvpktool
pkgname=$_pkgname-bin
pkgver=2.0.0.alpha.4
_pkgver=2.0.0-alpha.4
pkgrel=1
pkgdesc="An all new Titanfall VPK unpacker. Over 2x faster than the most popular alternative! (ALPHA binary pre-release)"
url="https://github.com/harmonytf/HarmonyVPKTool"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('webkit2gtk-4.1')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
_appimage=Harmony.VPK.Tool-$_pkgver.AppImage
source=("$_appimage::$url/releases/download/$_pkgver/harmony-vpk-tool_2.0.0_amd64.AppImage")
sha256sums=('d7bfac686bc6d4dc383a6c3f299fe29b33e7eba2bf9657a78ce310720cbafc80')

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
}

package() {
  cd squashfs-root/usr/share/icons/hicolor
  rm -dr 256x256
  mv 256x256@2 256x256
  cd $srcdir/squashfs-root/usr
  for i in 32 128 256 512; do
    mkdir -p "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    install -Dm644 share/icons/hicolor/${i}x${i}/apps/harmony-vpk-tool.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done
  install -Dm644 share/applications/harmony-vpk-tool.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/harmony-vpk-tool -t "$pkgdir/usr/bin"
}
