# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>
# Contributor: Patryk Kowalczyk <patryk AT kowalczyk dot ws>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>

pkgname=tpm-tools
pkgver=1.3.9.2
pkgrel=1
pkgdesc="Tools to manage and diagnose a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('trousers' 'opencryptoki')
source=(http://downloads.sourceforge.net/project/trousers/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        01-opencryptoki-soname.patch
        03-fix-bool-error-parseStringWithValues.patch
        04-fix-FTBFS-clang.patch)
#        05-openssl1.1_fix_data_mgmt.patch)
sha256sums=('8af837949a2ec30b195389ac8a2b31bc49fe315050751b7d4d0d432bf7812a97'
            'fa3a8440b49b7ade6522e940587b72c08e5549ee44a46aabf9754eca6f39e614'
            '8c6102112161890c4cdb398b529509ecf6f0c2ffe3d0d08ba09e120c48183d4b'
            'ee00e8932526f16ae062fcaf06168f78d46c71fe2e41cfe67394023bafbb4fe6')
#            'b27b76b951e643c2c2a101b6852acef6160856042d5cf3f5d5c33f4eb8f63e98')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/01-opencryptoki-soname.patch
  patch -p1 -i ${srcdir}/03-fix-bool-error-parseStringWithValues.patch
  patch -p1 -i ${srcdir}/04-fix-FTBFS-clang.patch
#  patch -p1 -i ${srcdir}/05-openssl1.1_fix_data_mgmt.patch
}

build() {
  cd ${pkgname}-${pkgver}
  sh bootstrap.sh
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-static \
              --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
