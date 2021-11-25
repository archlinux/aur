# Maintainer: Yushun Cheng <chengys339@163.com>

# name
pkgname=lenovo-100-m1520-m1688-series
# version
_srcdate=20210511095611
_pkgver=1.0
_revision=43
_pkgdate=20210420
pkgver=1.0.43
pkgrel=1
# generic
pkgdesc='Lenovo printer driver for 100, m1520, and m1688 series.'
arch=('x86_64')
url='https://www.lenovoimage.com/'
license=('custom:Lenovo')
# dependencies
depends=('cups' 'sane')
makedepends=('tar')
# source
source=("${pkgname}-${_pkgver}.${_revision}.7z::https://lenovo-upload.oss-cn-beijing.aliyuncs.com/drivers/L100_Series_drivers_Lin_${_srcdate}.7z")
# checks
sha256sums=('3ac923c20e25047edb12242ddbbcd626bc77990ec31332de2c84950dc9a1f386')

pkgver() {
  echo "${_pkgver}.${_revision}"
}

package() {
  # unzip tar
  tar -xf "${pkgname}-linux-installer_${_pkgver}-${_revision}_${_pkgdate}.tar.gz"
  # unzip deb
  cd "lenovo-100-m1520-m1688-series_${_pkgver}-${_revision}"/Installer
  ar x "lenovo-100-m1520-m1688-series_${_pkgver}-${_revision}_amd64.deb"
  # unzip data.tar.gz
  tar -xf data.tar.gz

  # package
  mkdir $pkgdir/usr
  # bin
  mv usr/local/bin $pkgdir/usr/bin
  # lib
  mkdir $pkgdir/usr/lib
  mv usr/lib/cups usr/lib/sane usr/lib/*.so $pkgdir/usr/lib
  # share
  mv usr/share $pkgdir/usr
  # etc
  mv etc $pkgdir
  # license
  mkdir -p $pkgdir/usr/share/licenses
  mv License $pkgdir/usr/share/licenses/$pkgname
}
