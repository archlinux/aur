# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_gitauth='cladisch'
_pkgname='linux-firewire-utils'
pkgname="${_pkgname}"
pkgver='0.4'
pkgrel='1'
pkgdesc='list and change the configuration of connected FireWire devices. Formerly jujuutils'
arch=('i686' 'x86_64' 'aarch64')
#url="http://code.google.com/p/jujuutils/"
url="https://github.com/${_gitauth}/${_pkgname}"
license=('GPL')
replaces=('jujuutils')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
#source=("http://jujuutils.googlecode.com/files/jujuutils-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5e80636dbbb90569700fc2fa6740f08e82c48237d340ea8cec4fda1e46997ef7')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'configure' ]; then
    aclocal
    autoconf
    automake --add-missing
  fi
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s -j1 # -j "$(nproc)" # Too small for parallel make
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
