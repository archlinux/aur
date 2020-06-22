# Maintainer: Thomas Perraut <https://github.com/tperraut/>
pkgname=godot-rc-bin
pkgver=3.2.2_rc3
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
sha512sums_i686=("08f30b10595ec0b46654fce9eb4e650d6081668e1e31540b2cfb356eb71b88b265fb293661b765b56452d3c485f29bfac56ca9304d152101e4eef963acdbcac6")
sha512sums_x86_64=("cffbe295ea20b51cb7244697b214c0ce43a69ac802479ac391a66aa16fea8d6923d9281daaa92ce33c46b81ba4f999bc544204905bb2570b7611597cf30d0e5e")

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