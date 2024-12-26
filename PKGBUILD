# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='doit'
pkgver='20240110'
pkgrel='1'
pkgdesc='yet another remote-execution daemon for Windows'
arch=('i686' 'x86_64')
url='https://www.chiark.greenend.org.uk/~sgtatham/doit/'
license=('MIT')
depends=('glibc')
makedepends=('cmake')
_srcdir="${pkgname}"
source=("doit-${pkgver}.tar.gz::${url}doit.tar.gz")
md5sums=('332d518e8eddf5dc8d00f9970dad187a')
sha256sums=('1c9178dc01e6b1aca0f485ebc5fb6be5d1b236ac0778edb6999c433fc1920113')

#_vercheck() {
#  curl -s -l 'http://tartarus.org/~simon-git/gitweb/?p=doit.git' | sed -n -e 's:^<td title="[^"]\+"><i>\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)</i></td>.*$:\1\2\3:p' | LC_ALL=C sort -n
#}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -d 'build' ]; then
    cmake -B 'build' -D CMAKE_INSTALL_PREFIX='/usr'
  fi
  #make -C 'build'
  cmake --build 'build'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  #make -C 'build' install DESTDIR="${pkgdir}"
  DESTDIR="${pkgdir}" cmake --install 'build' -j 1
  install -Dpm644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # spelling
  install -Dpm644 'README' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  set +u
}
set +u
