# Maintainer Kiernan Preve <kiernanpreve@gmail.com>

pkgname=rtl8188gu-dkms-git
pkgver=1.0  #As upstream source (to be discussed)
pkgrel=1
pkgdesc="Driver for Realtek RTL8188GU chipset wireless cards"
arch=('any')
url="https://github.com/supertsy5/rtl8188gu"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("rtl8188gu-dkms")
conflicts=("rtl8188gu-dkms")
source=("git+https://github.com/supertsy5/rtl8188gu.git"
        'dkms.conf')
sha256sums=('SKIP'
	    '116edfd7472ce25bb6971f22179e058e127216dea0a568bf7ddde89b01e6df98')

pkgver() {
    cd rtl8188gu
    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"    The upstream repo has version 1.0
    printf "1.0"
}

package() {
  # Install
  cd rtl8188gu
  #make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -pr * "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
