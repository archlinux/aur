# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-eglibc
pkgver=2.17
_basever=2.17-r4
pkgrel=2
pkgdesc="Embedded GNU C Library (${_target})"
arch=(any)
url="http://www.eglibc.org"
curl="http://www.eglibc.org"
license=('GPL')
groups=('frc-2015')
depends=("${_target}-linux-api-headers")
options=(!strip 'staticlibs' '!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/2014/arm/armv7a-vfp-neon/libc6_${_basever}_armv7a-vfp-neon.ipk"
        "http://download.ni.com/ni-linux-rt/feeds/2014/arm/armv7a-vfp-neon/libc6-dev_${_basever}_armv7a-vfp-neon.ipk"
	"http://download.ni.com/ni-linux-rt/feeds/2014/arm/armv7a-vfp-neon/libcidn1_${_basever}_armv7a-vfp-neon.ipk"
	"http://download.ni.com/ni-linux-rt/feeds/2014/arm/armv7a-vfp-neon/libthread-db1_${_basever}_armv7a-vfp-neon.ipk"
	"http://download.ni.com/ni-linux-rt/feeds/2014/arm/armv7a-vfp-neon/eglibc-extra-nss_${_basever}_armv7a-vfp-neon.ipk")
md5sums=('8c02625eb360fdf5b4de64265d5be5ce'
         '1b1af5fa61c80d08a85efb59db550795'
         '530e52baa9ead19ee03ef4c1eea10508'
         '7443d9118a024f1955cfc9fa60322f22'
         'f3a6a47aacbbe69667b3b20a3a69593f')

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
