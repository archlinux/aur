
# Maintainer:Carlos Enriquez Figueras <linguafalsa at gmail dot com>
pkgname=brother-fax2840
pkgver=1.1.0_1
pkgrel=1
pkgdesc="Brother FAX2840 driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash')
license=('custom:Brother')
source=(
http://download.brother.com/welcome/dlf005728/fax2840cupswrapper-3.0.1-1.i386.rpm
http://download.brother.com/welcome/dlf005726/fax2840lpr-3.0.1-1.i386.rpm
)
md5sums=(
  'a2efd7b93210b0020eb59a0e630ee2f8'
  'f46b6f7f71ec0e38fe56eb65dca2e65c'
)

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/FAX2840/cupswrapper/brother_lpdwrapper_FAX2840" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_FAX2840"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/FAX2840/cupswrapper/brother-FAX-2840-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}
