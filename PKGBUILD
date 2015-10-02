# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Gatien Bovyn <gatien.bovyn@gmail.com>
# Contributor: Guy Martin <gmsoft@tuxicoman.be>

set -u
_pkgname='pom-ng-console'
pkgname="${_pkgname}-git"
pkgver=0.0.5.r0.g6ca6980
pkgrel=2
pkgdesc='Packet-o-Matic real time network packet capture forensic tool'
pkgdesc+=' console interface'
arch=('i686' 'x86_64')
url='http://www.packet-o-matic.org/'
license=('GPL')
depends=('python3' 'pom-ng>=0.0.16')
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
  python 'setup.py' install --root "${pkgdir}"
  ln -sf '/usr/bin/pom-ng-console.py' "${pkgdir}/usr/bin/pom-ng-console"
  set +u
}
set +u
