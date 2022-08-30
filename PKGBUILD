pkgname=revbayes
pkgver=1.2.0
pkgrel=4
pkgdesc="Bayesian Phylogenetic Inference Using Graphical Models and an Interactive Model-Specification Language https://doi.org/10.1093/sysbio/syw021"
arch=(x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=('gcc-libs' 'boost-libs' 'openlibm')
makedepends=('boost' 'meson' 'ninja' 'cmake' 'git')
source=("git+$url.git#tag=v$pkgver")
conflicts=('lrzsz' 'revbayes-mpi')
md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname
  git submodule update --init --recursive
  ./projects/meson/generate.sh
}

build() {
  cd $srcdir/$pkgname
  arch-meson build
  ninja -C build
}

package() {
  cd $srcdir/$pkgname
  DESTDIR="${pkgdir}" ninja -C build install
}


