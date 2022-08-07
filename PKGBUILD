# Maintainer: Marvin Dalheimer <me@marvin-dalheimer.de>
pkgname=godot-mono-bin
pkgver=3.5
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine. It provides a huge set of common tools, so you can just focus on making your game without reinventing the wheel."
arch=("i686" "x86_64")
url="https://www.godotengine.org"
license=('MIT')
provides=("godot-mono-bin")
conflicts=("godot-mono")
depends=("mono>=6.12.0" "dotnet-sdk" "msbuild")
optdepends=("dotnet-core")
source=("godot-mono.desktop" "icons.tar.gz")
source_i686=("$pkgname-$pkgver-i686.zip::https://downloads.tuxfamily.org/godotengine/"$pkgver"/mono/Godot_v"$pkgver"-stable_mono_x11_32.zip")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://downloads.tuxfamily.org/godotengine/"$pkgver"/mono/Godot_v"$pkgver"-stable_mono_x11_64.zip")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp -r "$srcdir/Godot_v${pkgver}-stable_mono_x11_32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp -r "$srcdir/Godot_v${pkgver}-stable_mono_x11_64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac
  
  cp "$srcdir/godot-mono.desktop" "$pkgdir/usr/share/applications/godot-mono.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"

  case $CARCH in
    "i686")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_x11.32"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_x11.32" "$pkgdir/usr/bin/godot-mono"
    ;;
    "x86_64")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_x11.64"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_x11.64" "$pkgdir/usr/bin/godot-mono"
    ;;
  esac
}
md5sums=('c8ba9f7656b2c2db9a3ec385b3848bf5'
         '281c83d55c6a4d39fb9710e6f143bc5a')
md5sums_i686=('426d2222d8026f1d3f747ff269f9d633')
md5sums_x86_64=('614d9a53a1e05f3eab4c57a52005730a')
