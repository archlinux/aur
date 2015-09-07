# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# From pom-ng-console
# Contributor: Gatien Bovyn <gatien.bovyn@gmail.com>
# Contributor: Guy Martin <gmsoft@tuxicoman.be>

set -u
_pkgname='pom-ng-addons'
pkgname="${_pkgname}-git"
pkgver=0.0.2.r3.g07b9869
pkgrel=1
pkgdesc='Packet-o-Matic real time network packet capture forensic tool'
pkgdesc+=' web interface addons'
arch=('i686' 'x86_64')
url='http://www.packet-o-matic.org/'
license=('GPL')
depends=('pom-ng')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${pkgname^^}"
_giturl="https://github.com/gmsoft-tuxicoman/${_pkgname}"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_srcdir}::${_giturl//https:/git:}.git")
sha256sums=('SKIP')

pkgver () {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm644 * -t "${pkgdir}/usr/share/pom-ng/addons/"
  rm -f "${pkgdir}/usr/share/pom-ng/addons/README"
  set +u
}
set +u
