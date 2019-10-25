_pkgbase=rtl8189ES_linux
_pkgname=8189fs
pkgname=8189fs-dkms
pkgver=r48.54bd680
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8189FS and RTL8189FTV SDIO wireless devices."
arch=('armv7h')
url="https://github.com/jwrdegoede/rtl8189ES_linux/tree/rtl8189fs"
license=('GPL')
conflicts=("8189fs-git")
install=${pkgname}.install
depends=('linux' 'dkms')
makedepends=('linux-headers' 'git')
source=("git://github.com/jwrdegoede/$_pkgbase.git#branch=rtl8189fs"
	'dkms.conf')
sha256sums=("SKIP" "SKIP")
pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  # Make


  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
	  -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
