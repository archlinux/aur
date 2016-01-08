# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-eglibc
pkgver=2.20
_basever=2.20-r0.56
pkgrel=1
pkgdesc="Embedded GNU C Library (${_target})"
arch=(any)
url="http://www.eglibc.org"
curl="http://www.eglibc.org"
license=('GPL')
groups=('frc-2016')
depends=("${_target}-linux-api-headers")
options=(!strip 'staticlibs' '!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/libc6_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/libc6-dev_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/libcidn1_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/libc6-thread-db_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/libc6-extra-nss_${_basever}_cortexa9-vfpv3.ipk")
md5sums=('31f62c897cc648578ba1f09f974610d7'
         'd801797dbf2f80e4fc3c60dcc18898e4'
         '07bfe266a001c3b4487865310487d470'
         '9025cc8694f526989d9031e26094fa85'
         '42d9a0a5d8d519aab51bbb956199548d')

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
