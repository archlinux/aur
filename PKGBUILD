# Maintainer: xomachine <xomachiner@gmail.com>
pkgname=brother-hl2240dr
pkgrel=1
pkgver=3.1.0
pkgdesc="Brother HL-2240DR CUPS driver"
license=('GPL')
url="http://www.brother.com"
depends=("perl")
depends_x86_64=("lib32-glibc")
arch=("i686" "x86_64")

source=("http://download.brother.com/welcome/dlf101125/brgenml1cupswrapper-${pkgver}-1.i386.deb"
        "http://download.brother.com/welcome/dlf101123/brgenml1lpr-${pkgver}-1.i386.deb")
md5sums=('9d31b628b552959419f2f6c05e16b84a'
         'dea333f953fcce13c1239bf991524885')

package()
{
  cd "$srcdir"
  ar x brgenml1cupswrapper-3.1.0-1.i386.deb
  tar -xf "data.tar.gz"
  rm data.tar.gz
  rm control.tar.gz
  ar x brgenml1lpr-3.1.0-1.i386.deb
  tar -xf "data.tar.gz"
  rm data.tar.gz
  rm control.tar.gz
  sed -i -e 's/\(DEBUG\)=0/\1=1/' \
    -e 's%\(\$basedir\s*\)=~.*%\1=~ s/\\/filter\\/\.\*//;%' \
    -e 's/\(my \$PRINTER\)=.*/\1="BrGenML1";/' \
    "opt/brother/Printers/BrGenML1/cupswrapper/brother_lpdwrapper_BrGenML1"
  sed -i 's%/\$PRINTER%/cups%g' \
    "opt/brother/Printers/BrGenML1/lpd/filter_BrGenML1"
  install -m 755 -D "opt/brother/Printers/BrGenML1/cupswrapper/brother_lpdwrapper_BrGenML1" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_BrGenML1"
  install -m 644 -D "opt/brother/Printers/BrGenML1/cupswrapper/brother-BrGenML1-cups-en.ppd" "$pkgdir/usr/share/ppd/cupsfilters/brother-BrGenML1-cups-en.ppd"
  install -D "opt/brother/Printers/BrGenML1/cupswrapper/paperconfigml1" "$pkgdir/usr/bin/paperconfigml1"
  install -D "opt/brother/Printers/BrGenML1/inf/brBrGenML1func" "$pkgdir/usr/lib/cups/inf/brBrGenML1func"
  install -D "opt/brother/Printers/BrGenML1/inf/brBrGenML1rc" "$pkgdir/usr/lib/cups/inf/brBrGenML1rc"
  install -D "opt/brother/Printers/BrGenML1/lpd/rawtobr3" "$pkgdir/usr/lib/cups/lpd/rawtobr3"
  install -D "opt/brother/Printers/BrGenML1/lpd/filter_BrGenML1" "$pkgdir/usr/lib/cups/lpd/filter_BrGenML1"
  install -D "opt/brother/Printers/BrGenML1/lpd/brprintconflsr3" "$pkgdir/usr/lib/cups/lpd/brprintconflsr3"
}