# Maintainer: Tobias Göbel <kubax1983(at)gmail(dot)com>

_pkgbase=ncpfs
pkgname=ncpfs-module-dkms
pkgver=1
pkgrel=3
pkgdesc="The NCPFS kernel module (DKMS)"
arch=('i686' 'x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=("ncpfs-module.tar.gz"
        'dkms.conf')
sha512sums=('b8c7c3571a5eee8a39351371cb3193e052a0d97791ca1135cbbcc70dd85f4a79cd27b4bc8393f4345543a54554c85487797ab0187550550effba3049abcd3931'
            '1e3aa8ba9454d2ec0e4c441a8ad7aad9aeca39c784734fef2f959498788755d145ba653f1c349c366c0f7cbeaece5a24d4b7aeae7818973debf21be0b17603d2')
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
