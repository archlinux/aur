# Maintainer: Shu Takayama <syu.takayama@gmail.com>
pkgname="brother-mfc-l9570cdw"
_modelname="mfcl9570cdw"
pkgver="1.4.0"
pkgrel=1
pkgdesc="LPR and CPUS driver for the Brother MFC-L9570CDW"
url="https://support.brother.com"
license=('GPL' 'custom:brother commercial license')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc')
source=(
  "https://download.brother.com/welcome/dlf104309/${_modelname}lpr-1.3.0-0.i386.rpm"
  "https://download.brother.com/welcome/dlf104310/${_modelname}cupswrapper-1.4.0-0.i386.rpm"
  "cupswrapper${_modelname}.patch"
)
md5sums=(
  'bff7c86197ed72d4f2f3b9114c439979'
  'b74e4f7df61ee83c72c8cef5ff358e61'
  'a5acced898f21a3ebde0b671b09336de'
)

prepare() {
  patch -p1 < "cupswrapper${_modelname}.patch"
}

package() {
  cp -R "$srcdir/usr" "$pkgdir"
  cp -R "$srcdir/opt" "$pkgdir"
  mkdir -p "$pkgdir/usr/lib/cups/filter"
  DESTDIR="$pkgdir" "$pkgdir/opt/brother/Printers/${_modelname}/cupswrapper/cupswrapper${_modelname}"
}
