# Maintainer: Marvin Dalheimer <me@marvin-dalheimer.de>
pkgname=godot-mono-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine. It provides a huge set of common tools, so you can just focus on making your game without reinventing the wheel."
arch=("x86_64")
url="https://www.godotengine.org"
license=('MIT')
provides=("godot-mono-bin")
conflicts=("godot" "godot-git")
replaces=("godot" "godot-git")
depends=("mono>=5.4.0")
optdepends=("msbuild-bin")
source=("godot-mono.desktop" "icons.tar.gz")
source_x86_64+=("$pkgname-$pkgver.zip::https://downloads.tuxfamily.org/godotengine/"$pkgver"/mono/Godot_v"$pkgver"-stable_mono_x11_64.zip")
md5sums=('c8ba9f7656b2c2db9a3ec385b3848bf5'
         '281c83d55c6a4d39fb9710e6f143bc5a')
md5sums_x86_64=('24ad184f35aa393c2ba7cea557fde1e2')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -r "$srcdir/Godot_v"$pkgver"-stable_mono_x11_64" "$pkgdir/opt/$pkgname/godot"

  cp "$srcdir/godot-mono.desktop" "$pkgdir/usr/share/applications/godot-mono.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v"$pkgver"-stable_mono_x11.64"

  ln -s "/opt/"$pkgname"/godot/Godot_v"$pkgver"-stable_mono_x11.64" "$pkgdir/usr/bin/godot-mono"
}
