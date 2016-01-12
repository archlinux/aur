# Maintainer: Bill Pickett <pickett dot bill at gmail dot com>
# Contributor: Roman Konchits <admin at xan dot lt>
# Contributor: Hubert Maraszek <marach5 at gmail dot com>
# Contributor: schtroumpfette

pkgname=codeblocks-svn
pkgver=10640
pkgrel=1
pkgdesc="An open source and cross-platform C/C++ IDE"
arch=('i686' 'x86_64')
url="http://www.codeblocks.org"
license=('GPL')
groups=()
depends=('wxgtk2.8' 'valgrind' 'bzip2' 'hicolor-icon-theme' 'gamin' 'hunspell')
makedepends=('boost' 'subversion' 'zip')
optdepends=()
provides=('codeblocks')
conflicts=('codeblocks' 'codeblocks-svn-noplugins')
#install=codeblocks-svn.install
options=(!libtool)
source=('codeblocks-svn::svn+svn://svn.code.sf.net/p/codeblocks/code/trunk')
md5sums=('SKIP')

pkgver() {
cd "$SRCDEST/codeblocks-svn"
svnversion | tr -d [A-z]
}

build() {
cd codeblocks-svn
export WX_CONFIG_PATH=/usr/bin/wx-config-2.8
./bootstrap
./configure --prefix=/usr --with-contrib-plugins=all
make
}

package() {
cd codeblocks-svn
make DESTDIR="${pkgdir}" install
}

