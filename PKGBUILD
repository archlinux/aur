# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>

pkgname=libsidplay
pkgver=1.36.59
pkgrel=9
pkgdesc="A library for playing SID music files."
arch=('x86_64')
url="http://critical.ch/distfiles/"
license=('GPL')
depends=('gcc-libs')
source=(http://critical.ch/distfiles/${pkgname}-${pkgver}.tgz
        libsidplay-1.36.59-gcc43.patch
        g++-6_build.patch)
sha256sums=('3da9b38d4eb5bf9e936b9604ba92da0594ef38047d50cf806a8e11c400008024'
            '68476bfee9a378b045c81eb0f6d9aee7341610fe6b22047d67ce859a7a3b5053'
            '6612b8c684bfd80d88431d3aa7f5a3fc911528f25f67ab530f78a7592cc11e23')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../libsidplay-1.36.59-gcc43.patch
  patch -Np1 -i ../g++-6_build.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
