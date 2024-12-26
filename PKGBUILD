# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_gitauth='cladisch'
_pkgname='linux-firewire-utils'
pkgname="${_pkgname}"
pkgver='0.5.1'
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
md5sums=('463802c39c7eaf44cea025e3898b4950')
sha256sums=('73a1f3431247f66c83ec6355c47b964a2b621451cce548a8383d58ea569fbc04')

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
