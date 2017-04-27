

# Maintainer:Carlos Enriquez Figueras <linguafalsa at gmail dot com>
pkgname=brother-fax2940
pkgver=1.1.0_1
pkgrel=1
pkgdesc="Brother FAX2940 driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash')
license=('custom:Brother')
source=(
http://download.brother.com/welcome/dlf005748/fax2940cupswrapper-3.0.1-1.i386.rpm
http://download.brother.com/welcome/dlf005746/fax2940lpr-3.0.1-1.i386.rpm
)
md5sums=(
  'b06ac53f0113bacdd436f2eba5c7be8e'
  '968059da7f3bc82f87c2d1797630d1c2'
)

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/FAX2940/cupswrapper/brother_lpdwrapper_FAX2940" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_FAX2940"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/FAX2940/cupswrapper/brother-FAX-2940-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}
