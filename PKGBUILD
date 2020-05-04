# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=godot-voxel-bin
pkgver=3.2.2rc+cd8d43
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine"
arch=("i686" "x86_64")
url="http://www.godotengine.org"
license=("MIT")
provides=("godot")
conflicts=("godot" "godot-git")
source=("godot.desktop" "icons.tar.gz")
source_i686+=("$pkgname-$pkgver::https://github.com/tinmanjuggernaut/godot_voxel/releases/download/"$pkgver"/Godot_v"$pkgver"_x11.32.zip")
source_x86_64+=("$pkgname-$pkgver::https://github.com/tinmanjuggernaut/godot_voxel/releases/download/"$pkgver"/Godot_v"$pkgver"_x11.64.zip")
md5sums=("fa7422332b97ab8430ea7628ec8b0880" "48ee5f4295a45bb61c6223ba83fd1436")
md5sums_i686=("310282582d05419909b97e0bbd993cdc")
md5sums_x86_64=("6c36ba60eb2c19b1cc2283d8e407078b")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v"$pkgver"_x11.32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v"$pkgver"_x11.64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac

  cp "$srcdir/godot.desktop" "$pkgdir/usr/share/applications/godot.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/$pkgname/godot"

  ln -s "/opt/$pkgname/godot" "$pkgdir/usr/bin/godot"
}
