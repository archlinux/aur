# Maintainer Kiernan Preve <kiernanpreve@gmail.com>

pkgname=rtl8188gu-dkms-git
_pkgbase=rtl8188gu-dkms-git
pkgver=1.0
pkgrel=1
pkgdesc="Driver for Realtek RTL8188GU chipset wireless cards"
arch=('x86_64')
url="https://github.com/supertsy5/rtl8188gu"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("rtl8188gu-dkms")
source=("$pkgname::git+https://github.com/supertsy5/rtl8188gu.git"
        'dkms.conf')
sha256sums=('SKIP'
	    '116edfd7472ce25bb6971f22179e058e127216dea0a568bf7ddde89b01e6df98')

pkgver() {
    cd ${srcdir}/rtl8188gu-dkms-git
    printf '%s.r%s.g%s' '1.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install
  cd ${srcdir}/rtl8188gu-dkms-git
  #make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -pr * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
