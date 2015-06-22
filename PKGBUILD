#
# PKGBUILD for qtcbm-git
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=qtcbm-git
pkgver=r132.55243bf
pkgrel=2
epoch=
pkgdesc="Qt GUI Frontend for the (Open)CBM utils"
arch=('i686', 'x86_64')
url="https://github.com/mveinot/QtCBM"
license=('GPLv2')
groups=()
#depends=('qt5-base' 'qt-solutions' 'opencbm-git')
depends=('qt5-base' 'opencbm-git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/mveinot/QtCBM.git"
         "git+https://git.gitorious.org/qt-solutions/qt-solutions.git")
noextract=()
md5sums=('SKIP' 'SKIP')
_gitname=QtCBM
_gitrepo=https://github.com/mveinot/QtCBM.git

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
}

build() {
  cd "${srcdir}/${_gitname}"
  make -C diskimage -f Makefile.unix
  qmake
  make
}

check() {
  cd "${srcdir}/${_gitname}"
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir/" install
  install -Dm0755 QtCBM "$pkgdir/usr/local/bin/qtcbm-trunk"
}

# EOF
