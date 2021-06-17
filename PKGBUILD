# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Brad Gordon <brad@rpgcyco.net>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=libmcs
pkgver=0.7.2
pkgrel=3
pkgdesc='Library which abstracts the storage of configuration settings'
arch=('i686' 'x86_64')
#url='http://www.atheme.org/project/mcs'
url="https://github.com/atheme-legacy/${pkgname}"
license=('BSD')
depends=('libmowgli>=2.1.3')
#source=("http://distfiles.atheme.org/libmcs-${pkgver}.tbz2")
source=("https://github.com/atheme-legacy/libmcs/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7104eeff9b1fa375a5bda55fe4141158c251873e8a086cf08e57a1cf5d70e329')

prepare() {
  cd ${pkgname}-${pkgname}-${pkgver}
  sed -i "s/libmowgli/libmowgli-2/g" configure.ac
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-gconf --disable-kconfig
  make CPP=cpp
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/libmcs/COPYING"
}
