# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-eglibc
pkgver=2.23
_basever=2.23-r0.47
_year=2017
pkgrel=1
pkgdesc="Embedded GNU C Library (${_target})"
arch=(any)
url="http://www.eglibc.org"
curl="http://www.eglibc.org"
license=('GPL')
groups=('frc-toolchain')
depends=("${_target}-linux-api-headers")
options=('!strip' 'staticlibs' '!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/${_year}/arm/ipk/cortexa9-vfpv3/libc6_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/${_year}/arm/ipk/cortexa9-vfpv3/libc6-dev_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/${_year}/arm/ipk/cortexa9-vfpv3/libcidn1_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/${_year}/arm/ipk/cortexa9-vfpv3/libc6-thread-db_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/${_year}/arm/ipk/cortexa9-vfpv3/libc6-extra-nss_${_basever}_cortexa9-vfpv3.ipk")
md5sums=('3b99022865f148ed4a846ee0d7693160'
         'ba4d47fc0090395805f79e7e2d79b769'
         '7886688bd23948702c0956216228d51c'
         '9461c536f1eb2cc3ea3f47fdacc8c0cc'
         '806ccabe20694def89af3e44fdf6fd03')

package() {
  cd "${srcdir}"
  for file in *.ipk; do
    ar x $file
    tar xf data.tar.gz
  done

  mkdir -p ${pkgdir}/usr/${_target}
  rm -rf lib/eglibc
  find . \( -name .install -o -name ..install.cmd \) -delete
  cp -r lib ${pkgdir}/usr/${_target}
  cp -r usr ${pkgdir}/usr/${_target}
}
