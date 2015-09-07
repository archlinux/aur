# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: kfgz <kfgz at interia pl>

set -u
pkgname='pmr'
pkgver='1.01'
pkgrel='1'
pkgdesc='Command line filter that displays or limits the data bandwidth and total number of bytes passing through a pipe'
arch=('i686' 'x86_64')
#url="http://freshmeat.net/projects/pmr"
url="http://zakalwe.fi/~shd/foss/${pkgname}/"
license=('public domain')
#source=(${pkgname}-${pkgver}.tar.gz::http://freshmeat.net/urls/37445d537879ac7df392a0001c25b559)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c7e5b2eee2f0411a55afcb3a78a9e17ef545a764901277b3be0802396449af24')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s # -j "$(nproc)" # Too small for threaded make
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dpm755 'pmr' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'doc/pmr.1' -t "${pkgdir}/usr/share/man/man1/"
  set +u
}
set +u
