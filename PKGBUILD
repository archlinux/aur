# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=godot-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine. It provides a huge set of common tools, so you can just focus on making your game without reinventing the wheel."
arch=("i686" "x86_64")
url="http://www.godotengine.org"
license=('GPL')
provides=("godot-bin")
conflicts=("godot" "godot-git")
replaces=("godot" "godot-git")
source=("godot.desktop" "icons.tar.gz")
source_i686+=("https://downloads.tuxfamily.org/godotengine/"$pkgver"/Godot_v"$pkgver"_stable_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/"$pkgver"/Godot_v"$pkgver"_stable_x11.64.zip")
md5sums=("SKIP" "SKIP")
md5sums_i686=("SKIP")
md5sums_x86_64=("SKIP")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"
  
  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v"$pkgver"_stable_x11.32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v"$pkgver"_stable_x11.64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac

  cp "$srcdir/godot.desktop" "$pkgdir/usr/share/applications/godot.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/$pkgname/godot"

  ln -s "/opt/$pkgname/godot" "$pkgdir/usr/bin/godot"
}

