# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms-git
pkgver=r322.b9ff711
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://www.openwall.com/lkrg/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/openwall/lkrg/"
        'dkms.conf')
sha512sums=('SKIP'
            '2b4dd1787d318820b3bd3117ec0e5a57148ea67156ff27718d143d99e152fec0ce973b4f09c90889d4a72bca81a76f9b170580d27e5c3d54ab1dadebe4d85d72')
makedepends=('git') 
depends=('dkms')
provides=('lkrg-dkms')
conflicts=('lkrg-dkms')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;
}
