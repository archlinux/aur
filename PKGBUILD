# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Patryk Kowalczyk <patryk AT kowalczyk dot ws>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>

pkgname=tpm-tools
pkgver=1.3.8
pkgrel=3
pkgdesc="Tools to manage and diagnose a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('trousers' 'opencryptoki')
source=(http://downloads.sourceforge.net/project/trousers/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        'no-werror.patch')
sha256sums=('66eb4ff095542403db6b4bd4b574e8a5c08084fe4e9e5aa9a829ee84e20bea83'
            '02c79d976f5d7f783638ec4ce82740ba02f5ea1bb6c45c58bd6ec8de34bc6d2e')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -N -p1 -i ../no-werror.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--mandir=/usr/share/man \
	--enable-static \
	--sbindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
