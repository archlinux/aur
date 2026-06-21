# Maintainer: KasaneTeto <kasanetetofanaccount at proton.me>
# Contributor: Damglador <damglador at gmail.com>

pkgname=undertalemodtool-avalonia-bin
_pkgname=undertalemodtool-avalonia

pkgver=2026.06.21
_pkgver=$(date +"%Y.%m.%d")
pkgrel=1
arch=('x86_64')

pkgdesc="The rewrite of UndertaleModTool with a cross-platform framework Avalonia"
url="https://github.com/luizzeroxis/UndertaleModTool"
license=("GPL-3.0")

depends=("dotnet-runtime-10.0")
provides=("$_pkgname")
options=("!strip" "!debug")

source=(
  "${_pkgname}-${_pkgver}.zip::https://nightly.link/luizzeroxis/UndertaleModTool/workflows/publish_gui_avalonia/avalonia/GUI-ubuntu-latest-Release-isBundled-true-isSingleFile-false.zip"
  "${_pkgname}.desktop"
  "gamemaker-data.xml"
  "icon.png"
  )
sha256sums=(
  'SKIP'
  'efdd09628785b8d27cda3a0d9ef434ae8435041a199f12b7be39f697297a84c0'
  '64c7b9ab34a2c519f99533b85a6ff8b4a50710ec6ee93024f3b239493dc9d61e'
  '4f501b7495960a291dfaa3a5c7b87b529170c47447c365d2407d1d317d97c51f'
  )

noextract=("${_pkgname}-${_pkgver}.zip")

prepare() {
  mkdir -p "${_pkgname}-${_pkgver}"
  bsdtar -xf "${_pkgname}-${_pkgver}.zip" -C "${_pkgname}-${_pkgver}"
}

pkgver() {
  date +"%Y.%m.%d"
}

package() {
  install -d "$pkgdir/opt"

  # copy of the program files
  cp -r --preserve=mode "${_pkgname}-${_pkgver}" "$pkgdir/opt/${_pkgname}"

  # Linking the desktop in the path
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/undertalemodtool-avalonia/UndertaleModToolAvalonia "$pkgdir/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"

  # Mime type
  install -Dm644 gamemaker-data.xml "$pkgdir/usr/share/mime/packages/gamemaker-data.xml"
}
