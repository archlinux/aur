# Maintainer: Manel Castillo Giménez
pkgname="clavis-git"
pkgver="2.0.3"
pkgrel="2"
pkgdesc="An easy to use Password Manager. Development version"
arch=("x86_64")
url="https://github.com/ManelCG/clavis"
depends=("gtk4" "gtkmm-4.0" "cmake" "gpgme")
conflicts=("clavis" "clavis-debug")
optdepends=("git")

_gitroot="https://github.com/ManelCG/clavis.git"
_gitname="clavis"
source=()
sha256sums=()

package(){
  echo "Building Clavis..."
  cd ${srcdir}

  echo "Downloading Clavis from github..."
  if [ -d ${srcdir}/${_gitname} ]; then
    cd "${srcdir}/${_gitname}"
    git pull origin
    echo "Local files updated..."
  else
    git clone ${_gitroot} ${srcdir}/${_gitname}
  fi

  cd ${srcdir}/${_gitname}
  git checkout develop

  echo "Git checkout done"

  echo "Starting configure"

  BDIR=${pkgdir} ./make.sh archlinux
}
