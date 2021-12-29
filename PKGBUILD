# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms
pkgver=0.9.2
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://lkrg.org/'
license=('GPL2')
source=("${url}/download/${_pkgbase}-${pkgver}.tar.gz"
        "${url}/download/${_pkgbase}-${pkgver}.tar.gz.sign"
        'dkms.conf')
sha512sums=('5fec807618817bcb516e1a6779def6979badbdac6fe9b38fcce8425a0c7ebe3fb55c05d3080d8cac2d67cac6e8b7d2d77b3a1be450227299e2a02a311e223331'
            'SKIP'
            '25675f4e7691419a038f2804b98f38a0c3e8250665c6efff59c32fe65fca7b9829df82ea990b7af5fef8df629b7dc6a42f94862ba5c2000b85d783e51d5b9bba')
validpgpkeys=('297AD21CF86C948081520C1805C027FD4BDC136E')
depends=('dkms')

prepare() {
  # Set version
  cp dkms.conf "${_pkgbase}-${pkgver}"
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${_pkgbase}-${pkgver}/dkms.conf"
}

package() {
  # Copy sources (including Makefile)
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  cp -r "${_pkgbase}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;

  # Copy OUR dkms.conf
  install -Dm644 "${_pkgbase}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
