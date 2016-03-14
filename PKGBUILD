# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>

_pkgname=rtl8812au_rtl8821au
pkgname=rtl8812au_rtl8821au-dkms-git
_pkgver=4.3.22_beta
pkgver=4.3.22_beta.r9.928e27f
pkgrel=1
pkgdesc="Kernel module for RTL8812AU, RTL8821AU, RTL8811AU based on v4.3.14 driver from Realtek"
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/Grawp/rtl8812au_rtl8821au"
license=('GPL')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/Grawp/rtl8812au_rtl8821au.git#branch=${_pkgver}"
        'dkms.conf')
noextract=()
md5sums=('SKIP'
         'a92f81619a38b678e40abfdc309d30c8')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${srcdir}/dkms.conf"
}

package() {
  install -D "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
}
