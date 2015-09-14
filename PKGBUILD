# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Sebastien Binet <binet@farnsworth>

set -u
pkgname='latrace'
pkgver='0.5.11'
pkgrel='2'
pkgdesc='trace library calls and get their statistics in a manner similar to the strace utility (syscall tracing)'
arch=('i686' 'x86_64')
url='http://people.redhat.com/jolsa/latrace/index.shtml'
license=('GPL3')
depends=('glibc')
makedepends=('asciidoc')
_verwatch=("http://people.redhat.com/jolsa/${pkgname}/download.shtml" "dl/${pkgname}-\([0-9\.]\+\)\.tar\.bz2" 'l')
source=("http://people.redhat.com/jolsa/latrace/dl/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3b5afacafa8c1f9f00fb911466f4e2944162aaedfd81805f54e34c22652dbdd5')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  aclocal
  autoconf
  ./configure --prefix='/usr' --sysconfdir='/etc'
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
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u
