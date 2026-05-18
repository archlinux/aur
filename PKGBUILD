# Maintainer: KasaneTeto <kasanetetofanaccount at proton.me>

pkgname=undertalemodtool-avalonia-bin
_pkgname=undertalemodtool-avalonia

pkgver=2026.05.17
pkgrel=1
arch=('x86_64')

pkgdesc="The rewrite of UndertaleModTool with a cross-platform framework Avalonia"
url="https://github.com/luizzeroxis/UndertaleModTool"
license=("GPL-3.0")

depends=("dotnet-runtime-10.0")
provides=("$_pkgname")
options=("!strip" "!debug")

source=(
  "${_pkgname}-${pkgver}.zip::https://nightly.link/luizzeroxis/UndertaleModTool/workflows/publish_gui_avalonia/avalonia/GUI-ubuntu-latest-Release-isBundled-true-isSingleFile-false.zip"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
  "gamemaker-data.xml"
  "icon.png"
  )
sha256sums=(
  '240b44c3e9e51868c43914b1740baa34894d1976882c1ace3f00c0572e3a1951'
  '706b5653445f333ada38279ebd21e4f14439e9eb2bcce21ce9cae13230ceaaf0'
  'efdd09628785b8d27cda3a0d9ef434ae8435041a199f12b7be39f697297a84c0'
  '64c7b9ab34a2c519f99533b85a6ff8b4a50710ec6ee93024f3b239493dc9d61e'
  '4f501b7495960a291dfaa3a5c7b87b529170c47447c365d2407d1d317d97c51f'
  )

noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
  mkdir -p "${_pkgname}-${pkgver}"
  bsdtar -xf "${_pkgname}-${pkgver}.zip" -C "${_pkgname}-${pkgver}"
}

package() {
  install -d "$pkgdir/opt"

  # copy of the program files
  cp -r --preserve=mode "${_pkgname}-${pkgver}" "$pkgdir/opt/${_pkgname}"

  # Launcher script
  install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"

  # Mime type
  install -Dm644 gamemaker-data.xml "$pkgdir/usr/share/mime/packages/gamemaker-data.xml"
}
