# Maintainer: Benjamin Price <ben@benprice.dev>
pkgname=brother-dcpj987n-cups-bin
pkgver=1.0.5
pkgrel=0
pkgdesc="LPR and CUPS wrapper for Brother DCP-J987N-(W/B) printer"
arch=("i686" "x86_64")
url="https://support.brother.co.jp/j/b/downloadlist.aspx?c=jp&lang=ja&prod=dcpj987n&os=128"
license=("EULA")
groups=("base-devel")
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support')
source=("https://download.brother.com/welcome/dlf105217/dcpj987npdrv-$pkgver-$pkgrel.i386.rpm")
md5sums=("fcf8b5a6e744906d10eecd22821ae7b4")

package() {
  mkdir -p "$pkgdir/usr/lib/cups/filter/"
  mkdir -p "$pkgdir/usr/share/cups/model/"

  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"

  sed -i 's|\\\/opt\\\/|\\\/usr\\\/share\\\/|' "$pkgdir/usr/share/brother/Printers/dcpj987n/cupswrapper/brother_lpdwrapper_dcpj987n"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/share\\\/|' "$pkgdir/usr/share/brother/Printers/dcpj987n/lpd/filter_dcpj987n"

  ln -s "/usr/share/brother/Printers/dcpj987n/cupswrapper/brother_lpdwrapper_dcpj987n" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_dcpj987n"
  ln -s "/usr/share/brother/Printers/dcpj987n/cupswrapper/brother_dcpj987n_printer_en.ppd" "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/dcpj987n/inf" "$pkgdir/usr/share/brother/Printers/dcpj987n/lpd/"
}
