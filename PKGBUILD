# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=spt
pkgver=0.6
pkgrel=2
pkgdesc='Simple pomodoro timer that doubles your efficiency'
arch=('x86_64' 'aarch64')
url=https://github.com/pickfire/spt
license=('MIT')
depends=('libnotify')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1d475a607215e4a25642696afa020059739091963551349ee09a47b5968d4ec96ca7f144f31df7f6b2450458ce102d20a4d7ae5b456e22a03c7edda8d8ae696a')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's/CPPFLAGS =/CPPFLAGS +=/' config.mk
}

build() {
  cd ${pkgname}-${pkgver}
  make clean
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${PKGNME}/LICENSE
}
