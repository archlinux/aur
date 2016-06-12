# Maintainer: meriken <meriken.ygch.net@gmail.com>

pkgname=merikens-tripcode-engine-v3-git
_gitname=merikens-tripcode-engine-v3
pkgver=110.g2d9cd3b
pkgrel=1
pkgdesc='OpenCL- and CUDA-compatible custom tripcode generator'
arch=('i686' 'x86_64')
url='https://github.com/meriken/merikens-tripcode-engine-v3'
license=('GPLv3')
optdepends=(
    'cuda: Support for NVIDIA GPUs'
)
makedepends=('p7zip' 'cmake' 'opencl-headers')
makedepends=('ocl-icd')
source=("git+$url")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$_gitname"
    echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/$_gitname"
    ./BuildAll.sh
}


package() {
    cd "$srcdir/$_gitname/CMakeBuild"
    make DESTDIR="$pkgdir" install
    cd "../CLRadeonExtender/CLRX-mirror-master/build"
    make DESTDIR="$pkgdir" install
}