# Maintainer: dl3yc <dl3yc at darc dot de>

_pkgname=heather
pkgname=$_pkgname
pkgver=5.0.1
pkgrel=1
pkgdesc="Lady Heather's Disciplined Oscillator Control Program."
arch=(any)
url="http://www.ke5fx.com/heather/readme.htm"
provides=("${_pkgname}=${pkgver}")
makedepends=("gcc" "unzip")
depends=("libx11")
source=("http://www.ke5fx.com/heather/heatherx11.zip")
md5sums=("7b16c8b83a1ca7b38be5fc8f1224e3a5")

build() {
  unzip -n "${srcdir}/heatherx11.zip"
  cd ${srcdir}/heatherx11/
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/heather"
  cp "${srcdir}/heatherx11/heather" "${srcdir}/heatherx11/heather.cfg" \
    "${srcdir}/heatherx11/heather.xpm" "${pkgdir}/usr/share/heather/"
  cp `ls ${srcdir}/heatherx11/*.wav` "${pkgdir}/usr/share/heather/"
  ln -sf "/usr/share/heather/heather" "${pkgdir}/usr/bin/heather"
}
