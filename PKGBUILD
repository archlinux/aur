# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=bitsquare
pkgver=0.4.3
pkgrel=1
pkgdesc="Bitsquare is a cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bitsquare.io/"
license=('AGPL3')
source_x86_64=("https://github.com/bitsquare/bitsquare/releases/download/v${pkgver}/Bitsquare-64bit-${pkgver}.deb")
md5sums_x86_64=('a327dd5a9f8d7a3984c5116329b78be3')
_binname=Bitsquare

prepare() {
  tar -Jxvf data.tar.xz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Symlink some files to complete install.
  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
