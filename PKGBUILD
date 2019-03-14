# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=godot-bin
pkgver=3.1
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine"
arch=("i686" "x86_64")
url="http://www.godotengine.org"
license=("MIT")
provides=("godot-bin")
conflicts=("godot" "godot-git")
replaces=("godot" "godot-git")
source=("godot.desktop" "icons.tar.gz")
source_i686+=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/"$pkgver"/Godot_v"$pkgver"-stable_x11.32.zip")
source_x86_64+=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/"$pkgver"/Godot_v"$pkgver"-stable_x11.64.zip")
md5sums=("fa7422332b97ab8430ea7628ec8b0880" "9dbfaa636daf7737899de6a28c33c3be")
md5sums_i686=("2e398f291dbbe7a007b332f12344c68b")
md5sums_x86_64=("701f8a5ae40e5d75f0a2b16d2c810065")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v"$pkgver"-stable_x11.32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v"$pkgver"-stable_x11.64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac

  cp "$srcdir/godot.desktop" "$pkgdir/usr/share/applications/godot.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/$pkgname/godot"

  ln -s "/opt/$pkgname/godot" "$pkgdir/usr/bin/godot"
}
