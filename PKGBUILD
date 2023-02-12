# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=k8vavoom-git
_pkgver_base=build570509
pkgver=build570509.r16102.208236227
pkgrel=1
epoch=1
pkgdesc="Source port of Doom"
arch=(x86_64)
url="https://repo.or.cz/k8vavoom.git"
license=('GPLv2')

depends=("zlib" "bzip2" "libpng" "libjpeg" "sdl2" "sdl2_mixer" "openal")
makedepends=("cmake" "git")
optdepends=("libmad")

source=("$pkgname"::"git+$url#tag=$_pkgver_base")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "$_pkgver_base.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#    cd "$srcdir/$pkgname"
#    patch -p1 -i "${srcdir}/arch.patch"
#}

build() {
    cd "$srcdir/$pkgname"
    cmake -DCMAKE_BUILD_TYPE=Release    \
          -DCMAKE_INSTALL_PREFIX=/usr   \
          -DENABLE_MASTER=ON            \
          -DENABLE_SERVER=ON            \
          -DENABLE_VCCRUN=ON            \
          -DWITH_SYS_LIBPNG=ON          \
          -DARCH_LINUX_SPECIAL=ON       \
          .
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
}
