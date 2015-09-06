# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: B3nny <benny@b3nny.net>

set -u
pkgname='rush'
pkgver='1.7'
pkgrel='3'
pkgdesc='GNU Restricted User Shell'
arch=('i686' 'x86_64')
url='http://puszcza.gnu.org.ua/software/rush/'
license=('GPL3')
backup=('etc/rush.rc')
install='rush.install'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        'rush-1.7-glib-2.16-gets.patch')
sha256sums=('56ce434639d69817dd667d5243c49045f46101583ca9e0983f176d8b92eca301'
            '159dd2fc0fd4feec5d43cf7763a429b9c2da5c50597b157de9e5b376d9ff85a8')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/rush-1.7-glib-2.16-gets.patch"
  sed -i -e 's/^\( *[a-z#].*\)/#\1/g' 'etc/rush.rc'
  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --sbindir='/usr/bin'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

check() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
