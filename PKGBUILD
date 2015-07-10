# Maintainer: Jens Adam <jra@byte.cx>

_perlmod=App-Icli
pkgname=icli
pkgver=0.48
pkgrel=3
pkgdesc='Icinga Command Line Interface'
url='http://finalrewind.org/projects/App-Icli/'
license=('custom:WTFPL')
arch=('any')
depends=('perl-datetime' 'perl-datetime-format-strptime' 'perl-datetime-timezone' 'perl-list-moreutils' 'perl-term-size')
makedepends=('perl-module-build' 'perl-test-compile' 'perl-test-pod')
optdepends=('icinga')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
md5sums=('bc8a49aa80784553cd880ecafe059597' 'bc0f6763c990f8cf8fb99bf8758c86c6')

build() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  perl Build.PL installdirs=vendor destdir="${pkgdir}" \
    --icli-object-file=/var/spool/icinga/objects.cache \
    --icli-status-file=/var/spool/icinga/status.dat    \
    --icli-command-file=/var/spool/icinga/rw/icinga.cmd
  ./Build
}

check() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build test
}

package() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
