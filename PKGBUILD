# Maintainer: phaleth
pkgname=brother-dcp1622we-cups-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="CUPS wrapper for Brother DCP-1622WE printer"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcp1622we_eu"
license=('EULA')
groups=('base-devel')
source=("dcp1610wcupswrapper-${pkgver}-${pkgrel}.i386.deb::https://download.brother.com/welcome/dlf102486/dcp1610wcupswrapper-${pkgver}-${pkgrel}.i386.deb")
sha256sums=('660136a3fc54d75f8ccd29c161a917644e66f906bce7f288a37d70296026b066')

prepare() {
  deb="${srcdir}/dcp1610wcupswrapper-${pkgver}-${pkgrel}.i386.deb"
  bsdtar -xf "$deb" -C "$srcdir"
  for f in "$srcdir"/data.tar.* "$srcdir"/data.tar; do
    [ -f "$f" ] || continue
    bsdtar -xf "$f" -C "$srcdir"
  done
}

package() {
  cp -a "$srcdir/opt" "$pkgdir/opt"

  install -d "$pkgdir/usr/lib/cups/filter"
  ln -sf "/opt/brother/Printers/DCP1610W/cupswrapper/brother_lpdwrapper_DCP1610W" \
    "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_DCP1610W"

  install -d "$pkgdir/usr/share/cups/model"
  ln -sf "/opt/brother/Printers/DCP1610W/cupswrapper/brother-DCP1610W-cups-en.ppd" \
    "$pkgdir/usr/share/cups/model/brother-DCP1610W-cups-en.ppd"
}
