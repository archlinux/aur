# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Julian Langschaedel <meta.rb@gmail.com>
# also see: pacman -Si pv

set -u
_pkgname='pipebench'
pkgname="${_pkgname}-git"
pkgver=0.40.r5.g1809422
pkgrel=1
pkgdesc="pipebench: Measures the speed of stdin/stdout communication."
arch=('i686' 'x86_64')
url="https://github.com/ThomasHabets/pipebench"
license=('GPL2')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${_pkgname}"
_verwatch=("${url}/releases" "${url#*github.com}/archive/${pkgname}-\(.*\)\.tar\.gz" 'l')
source=("${url//https:/git:}")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcdir}"
  git describe --long --tags | sed -e "s:^${_pkgname}-::g" -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 'pipebench' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'pipebench.1' -t "${pkgdir}/usr/share/man/man1/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
