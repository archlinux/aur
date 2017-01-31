# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Bill Pickett <pickett dot bill at gmail dot com>
# Contributor: Roman Konchits <admin at xan dot lt>
# Contributor: Hubert Maraszek <marach5 at gmail dot com>
# Contributor: schtroumpfette

set -u
pkgname='codeblocks-svn'
pkgver=10982
pkgrel=1
pkgdesc='An open source and cross-platform C/C++ IDE'
arch=('i686' 'x86_64')
url='http://www.codeblocks.org'
license=('GPL')
depends=('wxgtk' 'valgrind' 'bzip2' 'hicolor-icon-theme' 'gamin' 'hunspell')
makedepends=('boost' 'subversion' 'zip')
provides=("codeblocks=${pkgver}")
conflicts=('codeblocks' 'codeblocks-svn-noplugins')
#install="${pkgname}.install"
options=('!libtool')
source=('codeblocks-svn::svn+svn://svn.code.sf.net/p/codeblocks/code/trunk')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd 'codeblocks-svn'
  svnversion | tr -d '[A-z]'
  set +u
}

build() {
  set -u
  cd 'codeblocks-svn'
  ./bootstrap
  WX_CONFIG_PATH='/usr/bin/wx-config' \
  ./configure --prefix='/usr' --with-contrib-plugins='all'
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  make -s -j"${_nproc}"
  set +u
}

package() {
  set -u
  cd 'codeblocks-svn'
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
