# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms
pkgver=0.7
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('x86_64')
url='https://www.openwall.com/lkrg/'
license=('GPL2')
source=("${url}/${_pkgbase}-${pkgver}.tar.gz"
        "${url}/${_pkgbase}-${pkgver}.tar.gz.sign"
        'dkms.conf')
sha512sums=('6f856d31aa79705e38a5436a47cb4e3f414a7734794713e6831426f1eda0f36ff1800e94dbfa9b211ab5b85055716c9b4839a8e46d292c9de95fc57b6cc02519'
            'SKIP'
            '3d4847efbf360cca967915d29d8566be14eab3828a790ccac36c780f0bd7c2a0aedde417c51992ec9ee0aabf61cd1109bd046ba0ec47b0ba31a3cbd4be55f7ad')
validpgpkeys=('297AD21CF86C948081520C1805C027FD4BDC136E')
depends=('dkms')

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${_pkgbase}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;
}
