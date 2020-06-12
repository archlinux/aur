# Maintainer: Thomas Perraut <https://github.com/tperraut/>
pkgname=godot-rc-bin
pkgver=3.2.2_rc1
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
sha512sums_i686=("d4268db900ce909d69405b97fcee10a8577d18ec21e7f448c1cc602e26ff181160bb1b2a5154e3730b597907785eb524691ef9ac4eacebcfaf0b61a4cb10fe44")
sha512sums_x86_64=("b40d0d9191874b43c6ae34473fd818023dba5a4103ebe896dec70e5f0b78a7d72343a0608c7e3b8d2f6770533f7a8e455e1c185ed4753737f4ff39c17ffff182")

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