# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics
pkgver=3.15.4.1
_base_recipe=R3.15.4-arch1
#_base_recipe=R3.15.5
pkgrel=2
pkgdesc="Experimental Physics and Industrial Control System"
arch=('any')
url="http://www.aps.anl.gov/epics/"
license=('EPICS Open License')
makedepends=('rpcsvc-proto')
depends=('aravis' 'glibmm' 'libtirpc')
source=("https://github.com/greyltc/ng3e/archive/v${pkgver}.tar.gz")
md5sums=('6caffba33eb23c1f4d1b3274f2d22ccf')

prepare() {
  cd "$srcdir/ng3e-${pkgver}"
  cd packages
}

build() {
  cd "$srcdir/ng3e-${pkgver}"
  cd packages
  make release PKG=base RCP=${_base_recipe}
  make release PKG=asyn RCP=ESS-R4-32+1-arch1
  make release PKG=autosave RCP=R5-8
  make release PKG=busy RCP=R1-6-1
  make release PKG=sscan RCP=R2-10-2-arch1
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
  cp -a "${srcdir}/ng3e-${pkgver}/root/${_base_recipe}" "${pkgdir}/opt/epics"
}
