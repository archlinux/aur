# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=hydra-git
pkgver=8.4.241.6444712
pkgrel=1
pkgdesc='Very fast network logon cracker which support many different services'
url='http://www.thc.org/thc-hydra/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('postgresql-libs' 'subversion' 'libssh' 'libmariadbclient' 'libidn' 'libfbclient' 'afpfs-ng' 'zlib' 'openssl' 'ncurses' 'pcre')
optdepends=('gtk2: graphical front-end (xhydra)')
makedepends=('git' 'gtk2' 'pkg-config')
provides=('hydra')
conflicts=('hydra')
source=(${pkgname}::git+https://github.com/vanhauser-thc/thc-hydra)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(grep Release CHANGES|head -n1|cut -d\  -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  ./configure --fhs
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
