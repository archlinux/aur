# Maintainer: J. Emiliano Deustua <edeustua@gmail.com>

pkgname=tblis-git
_pkgname=tblis
pkgver=v1.2.0.r17.g3dd4acb
pkgrel=1
pkgdesc="TBLIS is a library and framework for performing tensor operations, especially tensor contraction, using efficient native algorithms."
arch=('x86_64')
url="https://github.com/devinamatthews/tblis"
license=('BSD')
options=(staticlibs libtool)
makedepends=('git' 'gcc' 'openblas')
provides=('tblis')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    "./configure" \
        --prefix=/usr \
        --enable-thread-model=openmp \
        --enable-config=auto \
        --with-blas="-lopenblas"

    make
}

check() {
    ./$_pkgname/bin/test
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

