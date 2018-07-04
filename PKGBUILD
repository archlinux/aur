# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='doit'
pkgver='20160307'
pkgrel='1'
pkgdesc='yet another remote-execution daemon for Windows'
arch=('i686' 'x86_64')
url='https://www.chiark.greenend.org.uk/~sgtatham/doit/'
license=('MIT')
#depends=('perl')
source=("doit-${pkgver}.tar.gz::${url}doit.tar.gz")
sha256sums=('b547f0ccedd23bd1035ea83ee1820b8dd59b1e6aae3348f3e85533e592fbff7c')

_vercheck() {
  curl -s -l 'http://tartarus.org/~simon-git/gitweb/?p=doit.git' | sed -n -e 's:^<td title="[^"]\+"><i>\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)</i></td>.*$:\1\2\3:p' | LC_ALL=C sort -n
}

prepare() {
  set -u
  cd "${srcdir}/${pkgname}"
  ./configure
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}"
  make -s
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dpm644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # spelling
  install -Dpm644 'README' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  set +u
}
set +u
