# Maintainer: Thomas Perraut <https://github.com/tperraut/>
pkgname=godot-rc-bin
pkgver=3.2.2_rc4
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
sha512sums_i686=("0319e917a4260fd79f7364dd38d1ce62a8d46bd4f55f17adbefbb1f5a161b4ef7623764f32e2d75ae7ebc25c81abbe3b3f99c2bda3b23785ab03106c87101744")
sha512sums_x86_64=("7587b1450cacb7b0a3e52de918c0b8d88e6de4f6a6f251197acd1583d7cd9ec4d8dc33a638ab0330e03bf4a6862d0c9618dd30ee35b3a5a61a9c8bcd9060a012")

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