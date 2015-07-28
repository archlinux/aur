# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

set -u
pkgname='nettee'
pkgver='0.1.9.1'
pkgrel='3'
pkgdesc='A network "tee" program that can typically transfer data between "N" nodes.'
arch=('i686' 'x86_64')
url='http://saf.bio.caltech.edu/nettee.html'
license=('GPL2')
depends=('bash' 'glibc')
#depends_i686=('lib32-glibc')
#depends_x86_64=('glibc')
source=("http://saf.bio.caltech.edu/pub/software/linux_or_unix_tools/${pkgname}.tar.gz")
sha256sums=('9410919fcba0c4144a1208cda42548a5a1952f050aa90440c4245798c4d7b22f')

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  # This option fails with a compile error.
  # gcc -s -Wall -pedantic -std=c99 -D'NOUSLEEP' -D'_LARGEFILE64_SOURCE' -o 'nettee' 'nettee.c'
  gcc -s -Wall -D'_LARGEFILE64_SOURCE' -o 'nettee' 'nettee.c'
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"

  #install -dm755 "${pkgdir}/usr/share"/{man/man1,${pkgname}}

  install -Dpm644 {pdist_*.sh,README.TXT} -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm755 {nettee,README.TXT} -t "${pkgdir}/usr/share/${pkgname}/"

  install -Dpm644 'nettee.1' -t "${pkgdir}/usr/share/man/man1/"

  #install -Dpm755 "${pkgdir}/usr/share/${pkgname}/nettee" "${pkgdir}/usr/bin/nettee"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/usr/share/${pkgname}/nettee" "${pkgdir}/usr/bin/nettee"
  set +u
}
set +u
