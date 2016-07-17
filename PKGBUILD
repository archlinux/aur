# Maintainer: SebRmv
pkgname=binfmt_aout
pkgver=4.0
pkgrel=2
pkgdesc='binfmt_aout kernel module, for running an a.out binary format'
arch=('i686')
makedepends=('linux-headers' 'linux-api-headers' 'gzip')
url="https://www.kernel.org"
license=("GPLv3")
options=('!strip')
source=("https://raw.githubusercontent.com/torvalds/linux/v{$pkgver}/fs/binfmt_aout.c"
        "Makefile")
sha1sums=('461efd1c09b0b2420c1544ba5ec94952ecef4255'
	  'bb9af2aea2fe37ec2e54820762b862d02668bed6')
install=binfmt_aout.install

_kernel_version_i686=4.6

build(){ 
  cd "$srcdir" 
  make   
}

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_i686}"-ARCH
  install "${pkgname}".ko "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_i686}"-ARCH
  gzip "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_i686}"-ARCH/"${pkgname}".ko
}
