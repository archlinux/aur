# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pidgin-privacy-please
pkgver=0.7.1
pkgrel=1
pkgdesc='Pidgin plugin to stop spam'
url='https://github.com/cockroach/pidgin-privacy-please'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pidgin' 'libpurple')
makedepends=('intltool')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cockroach/pidgin-privacy-please/archive/release-${pkgver}.tar.gz)
sha512sums=('ab5cbec0cb81b278d63904c3c2eaa6e05d277976cfb6c4c1d4995af2ec317120d1c3a899adc841b9adc903fea703a19802b98b9e19984d74cf6d68bb2b8ddeb3')

prepare() {
	cd ${pkgname}-release-${pkgver}
  sh autogen.sh
}

build() {
	cd ${pkgname}-release-${pkgver}
  ./configure --prefix=/usr
	make
}

package() {
  cd ${pkgname}-release-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 ChangeLog README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
