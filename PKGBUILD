# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: jklee <klee.jonathan@gmail.com>

set -u
pkgname='ngp'
pkgver='1.3'
pkgrel='2'
pkgdesc='ncurses grep tool'
arch=('i686' 'x86_64')
url="https://github.com/jonathanklee/${pkgname}"
license=('GPL')
depends=('libconfig' 'pcre' 'ncurses')
makedepends=('git' 'automake' 'autoconf' 'gcc' 'make')
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
#source=(http://github.com/jonathanklee/ngp/archive/${pkgver}.tar.gz)
sha256sums=('2b352aa69dc4fbaa8433af0b684120e96737ae7062422eb76d6e8c3ad3ac6bc7')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
