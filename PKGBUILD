# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics
pkgver=3.15.4.1
_base_ver=R3.15.4
#_base_ver=R3.15.5
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System"
arch=('any')
url="http://www.aps.anl.gov/epics/"
license=('EPICS Open License')
depends=('aravis')
source=("https://github.com/greyltc/ng3e/archive/v${pkgver}.tar.gz")
md5sums=('ba76ff41e6e2b2bf2352c7ae80201160')

prepare() {
  cd "$srcdir/ng3e-${pkgver}"
  cd packages
}

build() {
  cd "$srcdir/ng3e-${pkgver}"
  cd packages
  make release PKG=base RCP=${_base_ver}-arch1
  make release PKG=asyn RCP=ESS-R4-32+1
  make release PKG=autosave RCP=R5-8
  make release PKG=busy RCP=R1-6-1
  make release PKG=sscan RCP=R2-10-2
  make release PKG=calc RCP=R5-4-2
  make release PKG=adsupport RCP=ESS-R1-3+1
  make release PKG=adcore RCP=ESS-R3-1+1
  make release PKG=adaravis RCP=arch-1
  make release PKG=aravisioc RCP=arch-1
  make release PKG=adtlccs RCP=master+1
  make release PKG=tlccsioc RCP=master+1
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -a "${srcdir}/ng3e-${pkgver}/root/${_base_ver}" "${pkgdir}/opt/epics"
}
