# Maintainer: Warren Eaton Sciaccaluga <warren.eaton.sciaccaluga@gmail.com>

# Based on https://aur.archlinux.org/packages/brother-dcpt520w

pkgname=brother-dcp-t426w
pkgver=3.5.0
pkgrel=1
install="brother-dcp-t426w.install"
pkgdesc="Driver for the Brother DCP-T426W wifi multifuncional printer"
arch=('any')
url="https://support.brother.com/g/b/downloadlist.aspx?c=us_ot&lang=en&prod=dcpt426w_all&os=127"
license=('custom:brother')
depends=('cups')
source=(
  "https://download.brother.com/welcome/dlf105501/dcpt426wpdrv-${pkgver}-2.i386.rpm"
  "fix_lp.patch"
)
sha256sums=(
  "213d33e6d19d4fb0cb833ed005e9c275710ac707b171c4bb1106e0a5824aa02b"
  "f8efd36763d952742326b0d616d0ea410fcffab2e83e30377ec5cc4893d4114d"
)

build() {
  cd "${srcdir}"
  patch -Np0 <fix_lp.patch
}

post_install() {
  /opt/brother/Printers/dcpt426w/cupswrapper/cupswrapperdcpt420w
}

package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/var/spool/lpd
  cp -R "${srcdir}/opt" "${pkgdir}/opt"
}
