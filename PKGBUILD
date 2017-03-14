# Maintainer: Tobias Göbel <kubax1983(at)gmail(dot)com>

_pkgbase=ncpfs
pkgname=ncpfs-module-dkms
pkgver=1
pkgrel=8
pkgdesc="The NCPFS kernel module (DKMS)"
arch=('i686' 'x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=("ncpfs-module.tar.gz"
        'dkms.conf')
sha512sums=('41125c2701d34709d1a5e1167d07421789cd8bff31517f236c96243f38eb6c6a68fedf74ef0689486c774a074dd957326c4b3978cbc695663db9a10bce2355db'
            '4319a2e5730b7052cb0111aaf5c38ace1d7ec33ea63256b81e35a7c2af408860bb7460e9f8f8e1b0ebbf6cf9326a6505334a71cf9b258bff3f1446be700d5542')
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
