# Maintainer: Daniel Durling <dgdurling@pm.me>
pkgname=circuitsimplusplus-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Rewrite of the classic CircuitSim logic simulator used in Georgia Tech's CS 2110/2200"
arch=("x86_64")
url="https://github.com/CS2200/CircuitSimPlusPlus"
license=("BSD-3-Clause")
depends=("zlib" "fuse2")
options=(!strip)

_appimage="CircuitSim++_0.4.2_amd64.AppImage"
source=("${_appimage}::https://github.com/CS2200/CircuitSimPlusPlus/releases/download/v${pkgver}/${_appimage}" "circuitsimplusplus.desktop")
sha256sums=(
  "bd2504ddc2749b5f7fc8ddaf485a90338e9139980518ed9e674ad89d7c69c3a1"
  "2517681bb748f8d232ebc2f9ec2a76e234563a34f4e46ddf548a4db0730dd188"
)

prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/circuitsimplusplus/circuitsimplusplus.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/circuitsimplusplus/circuitsimplusplus.AppImage" "${pkgdir}/usr/bin/circuitsimplusplus"

  install -Dm644 "${srcdir}/squashfs-root/CircuitSim++.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/circuitsimplusplus.png"

  install -Dm644 "$srcdir/circuitsimplusplus.desktop" "$pkgdir/usr/share/applications/circuitsimplusplus.desktop"
}
