# Maintainer: Noel Maersk <veox at wemakethings dot net>
# Contributors: https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/pcb

pkgname=pcb-git
_gitname=pcb
pkgver=4227.e6acd71d
pkgrel=1
epoch=1
pkgdesc='Interactive printed circuit board editor (latest git revision)'
url='http://pcb.geda-project.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtkglext' 'gd' 'gts')
optdepends=('tk: additional tools'
            'tcl: additional tools'
            'perl: additional tools'
	    'desktop-file-utils: desktop integration')
makedepends=('git' 'intltool' 'tk')
provides=('pcb')
conflicts=('pcb')
source=("git://git.geda-project.org/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --enable-dbus \
      --disable-update-mime-database \
      --disable-update-desktop-database

  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make -j1 prefix="$pkgdir/usr" install
}
