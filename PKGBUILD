# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pidgin-privacy-please-git
pkgver=0.7.1.125.8c63bcf
pkgrel=1
pkgdesc='Pidgin plugin to stop spam'
url='https://github.com/cockroach/pidgin-privacy-please'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pidgin' 'libpurple')
makedepends=('git' 'intltool')
provides=('pidgin-privacy-please')
conflicts=('pidgin-privacy-please')
source=(${pkgname}::git+https://github.com/cockroach/pidgin-privacy-please)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git tag|sed -r 's|(release-)?(.*)|\2|g'|sort -Vr|head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${pkgname}
  sh autogen.sh
}

build() {
	cd ${pkgname}
  ./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 ChangeLog README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
