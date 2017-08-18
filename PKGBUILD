# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-eglibc
pkgver=2.21
_basever=2.21-r0.83
pkgrel=2
pkgdesc="Embedded GNU C Library (${_target})"
arch=(any)
url="http://www.eglibc.org"
curl="http://www.eglibc.org"
license=('GPL')
groups=('frc-toolchain')
depends=("${_target}-linux-api-headers")
options=('!strip' 'staticlibs' '!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/2016/arm/ipk/cortexa9-vfpv3/libc6_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2016/arm/ipk/cortexa9-vfpv3/libc6-dev_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2016/arm/ipk/cortexa9-vfpv3/libcidn1_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2016/arm/ipk/cortexa9-vfpv3/libc6-thread-db_${_basever}_cortexa9-vfpv3.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2016/arm/ipk/cortexa9-vfpv3/libc6-extra-nss_${_basever}_cortexa9-vfpv3.ipk")
md5sums=('b0ebbf81bf8967e3c4cb4015e377c96c'
         '1f69e9ef7f61edad53bf325e2a83f6b2'
         '9e1a5b62312d0dba50a07b79c237e4ac'
         '49e2138e2d36ba014a891a5a41d628b9'
         '2fea5da4b5dbfc52dfc387d64935b9e1')

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
