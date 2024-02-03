# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_gitauth='cladisch'
_pkgname='linux-firewire-utils'
pkgname="${_pkgname}"
pkgver='0.5.0'
pkgrel='1'
pkgdesc='list and change the configuration of connected FireWire devices. Formerly jujuutils'
arch=('i686' 'x86_64' 'aarch64')
#url="http://code.google.com/p/jujuutils/"
#url="https://github.com/${_gitauth}/${_pkgname}"
url='https://git.kernel.org/pub/scm/utils/ieee1394/linux-firewire-utils.git'
license=('GPL-2.0-only')
depends=('glibc' 'bash')
makedepends=('meson')
replaces=('jujuutils')
#_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
#source=("http://jujuutils.googlecode.com/files/jujuutils-${pkgver}.tar.gz")
_srcdir="${pkgname}-${pkgver}"
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source=("https://git.kernel.org/pub/scm/utils/ieee1394/linux-firewire-utils.git/snapshot/${_srcdir}.tar.gz")
md5sums=('f04e9f8033b9cc39a4d1168e11d04aeb')
sha256sums=('8778a12a112e1845a692238f8d49d5f354988383a09473c4848f15c199f3d90a')

prepare() {
  set -u
  cd "${_srcdir}"
  #sed -e 's:\bpython\b:python2:g' -i 'src/crpp'
  mkdir 'build'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'build/build.ninja' ]; then
    meson setup --prefix='/usr' 'build'
  fi
  meson compile -C 'build'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  meson install -C 'build' --destdir "${pkgdir}"
  set +u
}
set +u
