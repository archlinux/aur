# Maintainer: Thomas Perraut <https://github.com/tperraut/>
pkgname=godot-rc-bin
pkgver=3.2.2_rc2
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine. It provides a huge set of common tools, so you can just focus on making your game without reinventing the wheel."
arch=("i686" "x86_64")
url="http://www.godotengine.org"
license=("MIT")
depends=('libxcursor' 'libxinerama' 'pulseaudio' 'alsa-lib' 'libxrandr' 'libxi' 'libglvnd')
provides=("godot-rc-bin")
source=("godot-rc.desktop")
source_i686+=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/${pkgver//_//}/Godot_v${pkgver/_/-}_x11.32.zip")
source_x86_64+=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/${pkgver//_//}/Godot_v${pkgver/_/-}_x11.64.zip")
sha512sums=("162275bd69f7d3fd4c408ed98734bfddaa4eb4684f3d81355da9255adbdeea01f1ed223999abeb329fb06fccd17d0d1442caba26c259e1d3833130f10afc5388")
sha512sums_i686=("cc86437d36824834fbb58520ae623a6402d007cfe62a92728f332ec65d9c5c5f42684bf6b1ca0bf0b15553fe024c702eb003fcd0606425435102931f63f57a01")
sha512sums_x86_64=("ecf80fe453bb15dbf342d9f97138b37d21f451f4d97ea3a9b8e76d51a3ce1349b2de953622f9603f7eaf37785111c767f6db58250c29630fa39e0cbe55a9aeb4")

package() {
  ver=${pkgver/_/-}
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v${ver}_x11.32" "$pkgdir/opt/$pkgname/godot-rc"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v${ver}_x11.64" "$pkgdir/opt/$pkgname/godot-rc"
    ;;
  esac

  cp "$srcdir/godot-rc.desktop" "$pkgdir/usr/share/applications/godot-rc.desktop"

  chmod +x "$pkgdir/opt/$pkgname/godot-rc"

  ln -s "/opt/$pkgname/godot-rc" "$pkgdir/usr/bin/godot-rc"
}