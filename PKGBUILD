# Maintainer: Curve <curve.platin at gmail.com>
pkgname=reclass.net-bin
_name=reclass.net
pkgver=1.2
pkgrel=1
pkgdesc="A reverse-engineering tool for dissecting data structures in memory"
arch=('x86_64')
url="https://github.com/ReClassNET/ReClass.NET"
license=('MIT')
depends=('mono' 'kdesu')
makedepends=(unrar)
provides=("reclass.net")
conflicts=("reclass.net")
source=("https://github.com/ReClassNET/ReClass.NET/releases/download/v${pkgver}/ReClass.NET.rar"
        "${_name}"
        "${_name}.desktop"
        "https://raw.githubusercontent.com/ReClassNET/ReClass.NET/master/LICENSE"
        )
noextract=("ReClass.NET.rar")
sha256sums=('3822bf8974df152cae17714ee484fdcc3ede5c1e26bc159c7c9e9e62e60b9f46'
            'a8f223b7b7b570bd8f40befa1428e05d341feee02bc27045757d68e2b1988e9d'
            '2252b64376c6b8c42c140b9888993f39a281502ae3d9ecdb736d3e4ec72f9bc9'
            'a446f219aabe3667850444bbd5f11b7e931889b4d5dbf3bc074fe00f25f1124c')

prepare() {
  unrar x ReClass.NET.rar
}

package() {
  # Install binary files
  install -dm644 "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/x64/." "${pkgdir}/usr/share/${pkgname}/"
  
  # Install startup script
  install -m 755 -D "${_name}" "${pkgdir}/usr/bin/${_name}"
  
  # Install license
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install desktop file
  install -m 644 -D "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}
