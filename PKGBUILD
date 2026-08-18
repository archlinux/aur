# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=schildichat-revenge
pkgname="${_pkgname}"-appimage
pkgver=26.08.08
pkgrel=1
pkgdesc="Desktop Matrix client written in Kotlin using the Matrix Rust SDK (AppImage version)"
arch=('x86_64')
url="https://github.com/SchildiChat/schildi-revenge"
license=('GPL-3.0-only')
provides=("$_pkgname")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "${_pkgname}-git"
  "schildi-revenge-appimage"
)
options=('!strip' '!emptydirs')
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${_appimage}::$url/releases/download/v$pkgver/$_pkgname-$arch-$pkgver.AppImage"
        "https://raw.githubusercontent.com/SchildiChat/schildi-revenge/refs/heads/main/LICENSE"
        "$_pkgname.png::https://raw.githubusercontent.com/SchildiChat/schildi-revenge/refs/heads/main/graphics/ic_notif_big.svg"
        "$_pkgname.desktop")
sha512sums=('b090fbfbb41695ec71142bfa1ceefaa3fd08172a53da89a9a58304e473f95b2b88ae3b7f16402eeb72c983b34e20523697732e144509eac71a8a096a3186c3e8'
            'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
            '336e93d96ea54fa24fad90495d15c56f11c1e61247e4a19da8ca6870ad2ee7c0af3862d3a7ba634ccceef414de4fd8062bcbbbfe33932aaf6ca76b492cb3b4bd'
            '6b429858d620f38e90940459d5d720690ecc413332f19c2b7d0f82a4a3d87c762e1509381e99123b6d3efd93a536849d21595f399e8dc27748de13c18897b229')

prepare() {
  chmod +x "${_appimage}"
}

package() {
  install -Dm755 "${_appimage}" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  install -Dm644 "LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/opt/$_pkgname/$_pkgname.png"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
  ln -s "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
