# Original Maintainer: James Duley <jagduley gmail>
# Previous Maintainer: 2bluesc <2bluesc gmail.com>
# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-arm-none-eabi-bin
pkgver=4.9_2015_q3_update
_pkgname=gcc-arm-none-eabi
_pkgver=${pkgver//_/-}
_pkgvershort=${_pkgver%-*}
_pkgvershort=${_pkgvershort/-q/q}
_pkgdate=20150921
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, does NOT include GDB)"
arch=('i686' 'x86_64')
if [ "${CARCH}" = "x86_64" ]; then
    depends=('lib32-glibc')
else
    depends=('glibc')
fi
optdepends=(
	  'arm-none-eabi-gdb: GNU Debugger for ARM EABI'
    )
provides=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
    )
conflicts=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
    )
url="https://launchpad.net/gcc-arm-embedded"
source="https://launchpad.net/gcc-arm-embedded/${pkgver%%_*}/${_pkgver}/+download/${_pkgname}-${_pkgvershort/./_}-${_pkgdate}-linux.tar.bz2"
license=('custom')
options=(!strip staticlibs)
sha256sums=('c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/gcc-*
  cp -a * $pkgdir/usr
  rm -f $pkgdir/usr/bin/arm-none-eabi-gdb
  rm -f $pkgdir/usr/bin/arm-none-eabi-gdb-py
}
