# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bitsquare-bin
pkgver=0.4.9.8
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bitsquare.io/"
license=('AGPL3')
source_x86_64=("https://github.com/bitsquare/bitsquare/releases/download/v${pkgver}/Bitsquare-64bit-${pkgver}.deb")
md5sums_x86_64=('060e452914c8445a2ea3f48e036c1573')
_binname=Bitsquare

prepare() {
  tar -Jxvf data.tar.xz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/bitsquare}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Symlink some files to complete install.
  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/bitsquare"
  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/bitsquare.desktop"
  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/bitsquare.png"
}
