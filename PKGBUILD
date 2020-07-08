# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms
pkgver=0.8.1
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('x86_64')
url='https://www.openwall.com/lkrg/'
license=('GPL2')
source=("${url}/${_pkgbase}-${pkgver}.tar.gz"
        "${url}/${_pkgbase}-${pkgver}.tar.gz.sign"
        'dkms.conf')
sha512sums=('38dd9e4d3b5a3011a23b94ca6e63ce61816a98e329eb8e5f127928d42e7ba3fa0acf2679d00327c77a1bc1e351200916a22a54a1a6b17297d0affc466a1e5e74'
            'SKIP'
            'ee259ac7e15fb6f6947ce6e64be808d6a1107d481ec0a7b4a35266bd720b639909c92e580fae2cecefe5318ce081a4d7431b5f941d1827f7783bee0a3206c5e8')
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
