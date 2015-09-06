# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Niklas Baumstark <niklas.baumstark at gmail>
# Contributor: Renato Zannon <renato.riccieri at gmail>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Achraf cherti <achrafcherti <at> gmail /dot/ com>

set -u
pkgname='redir'
pkgver='2.2.1'
pkgrel='5'
pkgdesc='Redirect TCP connections'
arch=('i686' 'x86_64')
url='http://sammy.net/~sammy/hacks/'
license=('GPL')
# tcp_wrappers is hard to set up and seems to not work right. running tcpdchk produces errors
#depends=('tcp_wrappers')
source=("http://sammy.net/~sammy/hacks/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7ea504f835338e448f674ca8637512f511bf74538418ad43ab39039017090e6c')

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  #make clean
  if [ "${depends:-}" = 'tcp_wrappers' ]; then
    make WRAP_CFLAGS=" -DUSE_TCP_WRAPPERS" WRAP_LIBS=" -lwrap"
  else
    make
  fi
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  install -Dpm644 'redir.man' "${pkgdir}/usr/share/man/man1/redir.1"
  install -Dpm755 'redir' "${pkgdir}/usr/bin/redir"
  set +u
}
set +u
