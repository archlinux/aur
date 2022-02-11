# Maintainer Kiernan Preve <kiernanpreve@gmail.com>

pkgname=rtl8188gu-dkms-git
_pkgbase=8188gu
pkgver=1.0
pkgrel=1
pkgdesc="Driver for Realtek RTL8188GU chipset wireless cards"
arch=('x86_64')
url="https://github.com/supertsy5/rtl8188gu"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("rtl8188gu-dkms-git")
source=("$pkgname::git+https://github.com/supertsy5/rtl8188gu.git"
        'dkms.conf')
sha256sums=('SKIP'
	    'SKIP')

pkgver() {
    cd ${srcdir}/rtl8188gu
    printf '%s.r%s.g%s' '1.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install
  cd ${srcdir}/rtl8188gu
  #make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -pr * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
