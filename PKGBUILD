# Maintainer: Tony Sokhon <tonyskn@gmail.com>

_pkgbase=rtl8192ee
pkgname=rtl8192ee-dkms
pkgver=07052014
pkgrel=2
pkgdesc="Driver for Realtek RTL8192EE chipset wireless cards (DKMS)"
arch=('i686' 'x86_64')
url="http://www.lwfinger.com/realtek_drivers"
license=('custom')
depends=('dkms' 'linux-headers')
conflicts=("${_pkgbase}")
install=${pkgname}.install

source=("${url}/0001-staging-r8192ee-Add-new-driver.patch"
        "${url}/0002-staging-r8192ee-Add-new-driver.patch"
        'dkms.conf')

md5sums=('697740cca4ec040273fbfd0bc2b6c20c'
         '5ca4cdfdd59092d3900f7d3a9405d3f3'
         'af944acfacec852151ed9d271de6d364')

prepare() {
  cd ${srcdir}
  patch -f -Np1 -i 0001-staging-r8192ee-Add-new-driver.patch || true
  patch -f -Np1 -i 0002-staging-r8192ee-Add-new-driver.patch
}

package() {
  # Copy sources (including Makefile)
  install -dm755 "${pkgdir}/usr/src"
  _destdir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  mv "${srcdir}/drivers/staging/${_pkgbase}" "${_destdir}"
  install -m644 dkms.conf "${_destdir}/dkms.conf"
}
