# Maintainer:
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Marvin Dalheimer <me@marvin-dalheimer.de>

## links
# https://godotengine.org
# https://github.com/godotengine/godot

_pkgname="godot-mono"
pkgname="$_pkgname-bin"
pkgver=4.3
pkgrel=2
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
url="https://github.com/godotengine/godot"
license=('MIT')
arch=("x86_64" 'i686' 'armv7h' 'aarch64')

depends=(
  'dotnet-sdk>=6.0'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxrandr'
  'libxrender'
)
makedepends=(
  'rsync'
)
optdepends=(
  'pipewire-alsa: for audio support'
  'pipewire-pulse: for audio support'
)

source=(
  "$_pkgname-$pkgver.desktop"::"https://raw.githubusercontent.com/godotengine/godot/$pkgver-stable/misc/dist/linux/org.godotengine.Godot.desktop"
  "$_pkgname-$pkgver.6"::"https://raw.githubusercontent.com/godotengine/godot/$pkgver-stable/misc/dist/linux/godot.6"
  "$_pkgname-$pkgver.svg"::"https://raw.githubusercontent.com/godotengine/godot/$pkgver-stable/icon.svg"
  "$_pkgname-$pkgver-license.txt"::"https://raw.githubusercontent.com/godotengine/godot/$pkgver-stable/LICENSE.txt"
)
source_x86_64=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_x86_64.zip")
source_i686=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_x86_32.zip")
source_armv7h=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_arm32.zip")
source_aarch64=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_arm64.zip")

sha256sums=(
  'eb8fb0f247b2bb2cff59ae88e6232286bd584ad13c005e41b7d9d7396bd5ef3c'
  '23f418e34ceeae51bc1c802645d6a56a6420e1bea0fbed503f66550539d01995'
  '7a91200f9b7fd77721ebdf01ea9f5f9b7b12937cf2eb5de6cd743893985ec048'
  'b0435e3b3e4e55238f05f4b306f30524a1b2e20147810d436eaa554fa6855c80'
)
sha256sums_x86_64=('ecdf3cd5a6004a6568c199581d58ba685a9905926e51677906b76fbdd9cad351')
sha256sums_i686=('9cf53023a6bfe903c5816bc0b6e3df039ff8990e469e42557d71cf6fa82cb3b9')
sha256sums_armv7h=('42d8cb761907be6e5895b732bed5c191cdb439ea4b650a0b20cf4fcc4e180207')
sha256sums_aarch64=('1ae242eb7dc30c281efef3f8a518580c9c997eb494a0b978d9504206a3f890c4')

package() {
  mkdir -p "$pkgdir/usr/bin"
  case $arch in
    x86_64)
      install -Dm755 Godot_v${pkgver}-stable_mono_linux_x86_64/Godot_v${pkgver}-stable_mono_linux.x86_64 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_64"
      ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_64" "$pkgdir/usr/bin/godot-mono-bin"
      rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_64/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
      ;;
    i686)
      install -Dm755 Godot_v${pkgver}-stable_mono_linux_x86_32/Godot_v${pkgver}-stable_mono_linux.x86_32 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_32"
      ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_32" "$pkgdir/usr/bin/godot-mono-bin"
      rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_32/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
      ;;
    armv7h)
      install -Dm755 Godot_v${pkgver}-stable_mono_linux_arm32/Godot_v${pkgver}-stable_mono_linux.arm32 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm32"
      ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm32" "$pkgdir/usr/bin/godot-mono-bin"
      rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_arm32/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
      ;;
    aarch64)
      install -Dm755 Godot_v${pkgver}-stable_mono_linux_arm64/Godot_v${pkgver}-stable_mono_linux.arm64 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm64"
      ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm64" "$pkgdir/usr/bin/godot-mono-bin"
      rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_arm64/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
      ;;
  esac

  install -Dm644 \
    "${srcdir}/$_pkgname-$pkgver.svg" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

  install -Dm644 \
    "${srcdir}/$_pkgname-$pkgver-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 \
    "${srcdir}/$_pkgname-$pkgver.6" \
    "${pkgdir}/usr/share/man/man6/godot-mono-bin.6"

  install -Dm644 \
    "${srcdir}/$_pkgname-$pkgver.desktop" \
    "${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"

  sed -i "s/Exec=godot/Exec=godot-mono-bin/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"
  sed -i "s/Icon=godot/Icon=godot-mono-bin/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"
  sed -i "s/Name=Godot Engine/Name=Godot Engine Mono/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"
}
