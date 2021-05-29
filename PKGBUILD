# Maintainer: Hrishikesh Barman <hrishikesh no space here my fren bman+arch@gmail.com>
#
# NOTE: all my packages will go under the prefix jaapi
# NOTE: maybe update this package to deliver the executable directly
# NOTE: some of this was directly picked from the package maintained by Vresod
pkgname=jaapi-advcpmv
pkgver=0.8
pkgrel=1
pkgdesc="jaruns patches for advcpmv, this is an optional dependency to get progress bar for cp and mv in the n3 file manager"
arch=(x86_64)
url="https://github.com/jarun/advcpmv"
license=('unknown')
makedepends=(git)
provides=(cpg mvg)
conflicts=(cpg mvg)

# custom variables
_coreutils_version=8.32
_advcpmv_repo_name=advcpmv

# sources
source=(
  "http://ftp.gnu.org/gnu/coreutils/coreutils-$_coreutils_version.tar.xz"
  "git+https://github.com/jarun/advcpmv"
)
sha256sums=(
  '4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa'
  'SKIP'
)

prepare() {
  cd coreutils-$_coreutils_version
  mv ../$_advcpmv_repo_name/$_advcpmv_repo_name-$pkgver-$_coreutils_version.patch .
  patch -p1 -i $_advcpmv_repo_name-$pkgver-$_coreutils_version.patch
  ./configure
}

build() {
  cd coreutils-$_coreutils_version
  make
}

package() {
  install -Dm755 coreutils-$_coreutils_version/src/cp $pkgdir/usr/local/bin/cpg
  install -Dm755 coreutils-$_coreutils_version/src/mv $pkgdir/usr/local/bin/mvg
}
