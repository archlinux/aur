# Maintainer: Manel Castillo Giménez
pkgname="sempiternum-git"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="Software to analyze Holomorphic Maps and their dynamics"
arch=("x86_64")
url="https://github.com/ManelCG/sempiternum"
depends=("libclc" "opencl-headers" "ocl-icd" "gtk3" "cairo" "pango" "pixman" "ffmpeg")
conflicts=("sempiternum")
optdepends=(
  "opencl-amd: For AMD GPUs"
  "opencl-nvidia: For Nvidia GPUS"
)
_gitroot="https://github.com/ManelCG/Sempiternum.git"
_gitname="sempiternum"
source=()
sha256sums=()

package(){
  echo "Building Sempiternum..."
  cd ${srcdir}

  echo "Downloading Sempiternum from github..."
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
