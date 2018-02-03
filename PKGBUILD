# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
# (mostly a ripoff of pantum-p2000-driver, with a few enhancements)
pkgname=pantum-p2200-p2500-driver
pkgver="1_80"
pkgrel=1
pkgdesc="Pantum P2200 and P2500 series drivers"
arch=('x86_64')
url="http://global.pantum.com/global/"
license=('proprietary')
depends=('cups')
makedepends=('unzip')
_basename="Pantum-P2200-P2500-Series-Linux-Driver-V${pkgver/_/-}"
_zipname="${_basename}.zip"
source=(
  "http://global.pantum.com/global/wp-content/uploads/2016/01/${_zipname}"
)
md5sums=('50de9a64560ff92cdfd14fd6cdf636a5')

build() {
  cd ${srcdir}

  unzip -p ${_zipname} | bsdtar xzf - "LinuxInstall/Resources/Pantum-P2500-Series-*.${CARCH}.deb"
  ar x LinuxInstall/Resources/Pantum-P2500-Series-*.${CARCH}.deb data.tar.gz
  mkdir -p ${pkgname}-${pkgver}
  bsdtar -xf data.tar.gz -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgdir}
  cp -a ${srcdir}/${pkgname}-${pkgver}/* .
}

# vim:set ts=2 sw=2 et:
