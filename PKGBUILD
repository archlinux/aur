# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=schildi-revenge
pkgname="${_pkgname}"-appimage
pkgver=26.03.03
pkgrel=1
pkgdesc="Desktop Matrix client written in Kotlin using the Matrix Rust SDK (AppImage version)"
arch=('x86_64')
url="https://github.com/SchildiChat/schildi-revenge"
license=('GPL-3.0-only')
#provides=("${_pkgname}=${pkgver}")
provides=("$_pkgname")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "${_pkgname}-git"
)
options=('!strip' '!emptydirs')
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${_appimage}::$url/releases/download/v$pkgver/SchildiChatRevenge-$arch-$pkgver.AppImage"
		"https://raw.githubusercontent.com/SchildiChat/schildi-revenge/refs/heads/main/LICENSE"
        "$_pkgname.png::https://raw.githubusercontent.com/SchildiChat/schildi-revenge/refs/heads/main/graphics/ic_notif_big.svg"
        "$_pkgname.desktop")
sha512sums=('e59eddee6b51a559e7e7b3e9a20b9c58ed50579abe339fb071303e5d2ebe0c1204fe611caed064237422eb904351c034e05c4101f95bf1ed9db773c329bc34ad'
            'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
            '336e93d96ea54fa24fad90495d15c56f11c1e61247e4a19da8ca6870ad2ee7c0af3862d3a7ba634ccceef414de4fd8062bcbbbfe33932aaf6ca76b492cb3b4bd'
            ''f3f30c0730983852a4c684d4a1250ec896b81e9a409974563a896083d1e9fb801c495b46567b1d29a3f8c0ab5a26ec05c20686ddda1883eaddb6ba1ff060e346)

prepare() {
  chmod +x "${_appimage}"
}

package() {
  #install -Dm755 "$srcdir/${_appimage}" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  #install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"
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
