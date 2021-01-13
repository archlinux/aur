# Maintainer: KopfKrieg <archlinux at absolem dot cc>
# Contributor: Daniel Wyatt <Daniel.Wyatt at gmail dot com>
# Contributor: André Fettouhi <a.fettouhi at gmail dot com>
pkgname=brother-hll2375dw
pkgver=4.0.0
pkgrel=2
pkgdesc='Brother HL-L2375DW CUPS driver'
arch=('i686' 'x86_64')
url='http://www.brother.com'
license=('GPL')
depends=('cups' 'perl')
source=(http://download.brother.com/welcome/dlf103533/hll2375dwpdrv-$pkgver-1.i386.rpm)
sha256sums=('ce32797b7f344d2cd7dec958a65a35887ab604a5e47f108de096e8caeb098a85')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2375DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2375DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2375DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2375DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/HLL2375DW/cupswrapper/brother-HLL2375DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/HLL2375DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/HLL2375DW/lpd/"
  ln -s "/usr/share/brother/Printers/HLL2375DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/HLL2375DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/HLL2375DW/inf" "$pkgdir/usr/share/brother/Printers/HLL2375DW/lpd/"
}

