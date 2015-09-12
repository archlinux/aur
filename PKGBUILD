# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Sven Kauber <celeon@gmail.com>

set -u
pkgname='lsat'
pkgver='0.9.8.2'
pkgrel='1'
pkgdesc='A post install security auditor for Linux/Unix'
arch=('i686' 'x86_64')
url='http://usat.sourceforge.net/'
license=('GPL')
depends=('popt')
optdepends=('nmap' 'lsof')
_verwatch=('http://sourceforge.net/projects/usat/files/' "/projects/usat/files/${pkgname}-\(.*\)/stats/timeline" 'l')
source=("http://usat.sourceforge.net/code/${pkgname}-${pkgver}.tgz")
sha256sums=('872af268cb0f91f26c286beada4d356bb04ad637c81ff043f5ea0a2d13f17bac')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix='/usr' \
    --bindir='/usr/bin' \
    --mandir='/usr/share/man'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s -j "$(nproc)" CFLAGS="${CFLAGS}"
  make manpage
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    INSTALL='/bin/install' \
    install installman
  set +u
}
set +u
