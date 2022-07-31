# Maintainer: Manel Castillo Giménez
pkgname="clavis-git"
pkgver="1.0.3"
pkgrel="1"
pkgdesc="An easy to use Password Manager. Development version"
arch=("x86_64")
url="https://github.com/ManelCG/clavis"
depends=("gtk3" "cairo" "pango" "pixman" "pass" "make" "pkgconf" "xdotool" "xclip" "grep" "awk" "gnupg")
conflicts=("clavis")
optdepends=()

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

  make BDIR=${pkgdir} archlinux
}
