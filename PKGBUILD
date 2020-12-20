# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Fernando < arch at liquuid dot net >
# Contributor: Damir Perisa <damir dot perisa at bluewin dot ch>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

set -u
pkgname='pipemeter'
pkgver='1.1.4'
pkgrel='1'
pkgdesc='A command line utility that displays the speed and, if possible, progress, of data moving from its input to its output.'
arch=('i686' 'x86_64')
url='http://spamaps.org/pipemeter.php'
license=('GPL2')
makedepends=('patch')
#source=("http://spamaps.org/files/pipemeter/${pkgname}-${pkgver}.tar.gz" 'patch')
_srcdir="${pkgname}-${pkgver}"
source=("https://launchpad.net/pipemeter/trunk/${pkgver}/+download/${_srcdir}.tar.gz")
md5sums=('6884e1a6db19ecbee5f2aabde9fd6a94')
sha256sums=('dfdea37fcc236c32cb4739665d13cff56c3e46d3b28eed5d96e62a565472474a')

prepare() {
  set -u
  cd "${_srcdir}"
  # make package compatible
  sed -e '/\/man\// s:\$(PREFIX)/man:$(PREFIX)/share/man:g' \
      -e '/install / s: \$(PREFIX): -t "$(DESTDIR)"$(PREFIX):g' \
      -e '/install / s:install : install -D :g' \
      -e '/install / s:[a-z0-9]$:&/:g' \
    -i 'Makefile.in'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr'
  fi
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
