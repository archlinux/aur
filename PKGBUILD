# Maintainer: xiannox <xian.nox@gmail.com>

# General package information
pkgname=quill-git
pkgver=tip
pkgrel=1
pkgdesc="A lightweight web browser"
arch=("i686" "x86_64")
url="https://bitbucket.org/xiannox/quill"
license=('GPL3')
depends=('qt5-webengine')
makedepends=('git' 'qt5-tools')
conflicts=('quill')
provides=('quill')

install=quill.install

# Repository-related
_clonedir=quill-src
source=("$_clonedir"::'git+https://bitbucket.org/xiannox/quill.git')
# To check out a specific branch append #branch=<branch> to the end of the URL
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_clonedir/src"
  printf "%s.%s.r%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list `git describe --abbrev=0 --tags`..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_clonedir/src"
  #lrelease-qt5 resources/translations/*.ts
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_clonedir/src"
  make INSTALL_ROOT="${pkgdir}" install
}
