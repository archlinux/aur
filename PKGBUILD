# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Garcia <morbidj at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Orzanna <orschiro at gmail dot com>

set -u

#_ubver='1.7.2~174~ubuntu14.04.1'; _libgee='libgee06' # This won't build with vala=0.12 or vala=0.28.0
#_ubver='1.7.3~177~ubuntu15.10.1' # not found
#_ubver='1.7.3~177~ubuntu15.04.1' # not found
#_ubver='1.7.3~177~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
#_ubver='1.7.5~180~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
#_ubver='1.7.6~184~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
#_ubver='17.2'; _ubrel='429'; _libgee='libgee>=0.18.0'
_ubver='17.11'; _libgee='libgee>=0.18.0'
pkgname='timeshift'
pkgver="${_ubver}"
pkgrel='1'
pkgdesc='A system restore utility for Linux'
arch=('i686' 'x86_64')
#url='https://launchpad.net/~teejee2008/+archive/ubuntu/ppa'
#url='https://code.launchpad.net/~teejee2008/timeshift'
#url='https://launchpad.net/timeshift'
url='https://github.com/teejee2008/timeshift'
license=('GPL')
_arch_depends=('rsync' 'libgee06' 'json-glib') # from installer/install.sh
_arch_depends[1]="${_libgee}"
depends=('gtk3' 'libsoup' 'desktop-file-utils' "${_arch_depends[@]}" 'cron')
unset _arch_depends
optdepends=('gksu: run timeshift from a menu')
makedepends=('vala' 'diffutils' 'coreutils' 'vte3')
options=('!emptydirs')
#_verwatch=("${url//code/bazaar}/trunk/changes" 'v\([0-9\.]\+\)' 't')
#source=("${url}/+files/${_srcdir}.tar.gz")
#_srcdir='~teejee2008/timeshift/trunk'
#source=("timeshift_v${_ubver}_r${_ubrel}.tgz::${url//code/bazaar}/trunk/tarball/${_ubrel}")
_github='teejee2008'
_verwatch=("https://github.com/${_github}/${pkgname}/releases.atom" '\s\+<title>Timeshift v\([0-9\.]\+\)</title>.*' 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}_v${pkgver}.tgz::https://github.com/${_github}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2cdcd3a6c8c0a78240c944423ba49b488144924524d9e7a2e787e29aea5ab38b')
#sha256sums[0]='SKIP'

build() {
  set -u
  make -C "${_srcdir}" -s -j1
  set +u
}

package() {
  set -u
  make -C "${_srcdir}" DESTDIR="${pkgdir}" install
  set +u
}
set +u
