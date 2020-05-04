# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=godot-mono-voxel-bin
pkgver=3.2.2rc+cd8d43
pkgrel=2
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine"
arch=("i686" "x86_64")
url="http://www.godotengine.org"
license=("MIT")
provides=("godot-mono")
conflicts=("godot-mono" "godot-mono-git")
depends=("mono>=5.18.0" "dotnet-sdk" "msbuild")
source=("godot-mono.desktop" "icons.tar.gz")
source_i686+=("$pkgname-$pkgver::https://github.com/tinmanjuggernaut/godot_voxel/releases/download/"$pkgver"/Godot_v"$pkgver"_mono_x11_32.zip")
source_x86_64+=("$pkgname-$pkgver::https://github.com/tinmanjuggernaut/godot_voxel/releases/download/"$pkgver"/Godot_v"$pkgver"_mono_x11_64.zip")
md5sums=("c8ba9f7656b2c2db9a3ec385b3848bf5" "281c83d55c6a4d39fb9710e6f143bc5a")
md5sums_i686=("9ae66d7151f86f8944f6705270a21244")
md5sums_x86_64=("0d80d7a6372e6f72256f01b4adba4ed3")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp -r "$srcdir/Godot_v"$pkgver"_mono_x11.32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp -r "$srcdir/Godot_v"$pkgver"_mono_x11_64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac

  cp "$srcdir/godot-mono.desktop" "$pkgdir/usr/share/applications/godot-mono.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  case $CARCH in
    "i686")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}_mono_x11.32"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}_mono_x11.32" "$pkgdir/usr/bin/godot-mono"
    ;;
    "x86_64")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}_mono_x11.64"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}_mono_x11.64" "$pkgdir/usr/bin/godot-mono"
    ;;
  esac
}
