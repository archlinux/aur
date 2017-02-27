# Maintainer: Tobias Göbel <kubax1983(at)gmail(dot)com>

_pkgbase=ncpfs
pkgname=ncpfs-module-dkms
pkgver=1
pkgrel=4
pkgdesc="The NCPFS kernel module (DKMS)"
arch=('i686' 'x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=("ncpfs-module.tar.gz"
        'dkms.conf')
sha512sums=('b8c7c3571a5eee8a39351371cb3193e052a0d97791ca1135cbbcc70dd85f4a79cd27b4bc8393f4345543a54554c85487797ab0187550550effba3049abcd3931'
            '770cc3d0f0be2f5f2e69d9a556fe3edfb31fb410ed2257f36906f32f9bd7bc38047dfd922725c0281fca5a1baf85a946f7bbc4bd07272e8255450a2787126443')
package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
