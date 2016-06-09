pkgname=libc++-3.8.0
pkgver=3.8.0
pkgrel=1
pkgdesc="LLVM libc++-3.8.0"
arch=('i686' 'x86_64')
url="https://libcxx.llvm.org/"
license=('MIT' 'NCSA')
depends=('clang')
makedepends=('subversion')
checkdepends=('check')
provides=('libc++')
conflicts=('libc++')
source=('llvm/::svn+https://llvm.org/svn/llvm-project/llvm/tags/RELEASE_380/final/'
        'libcxx/::svn+https://llvm.org/svn/llvm-project/libcxx/tags/RELEASE_380/final/'
        'libcxxabi/::svn+https://llvm.org/svn/llvm-project/libcxxabi/tags/RELEASE_380/final/')
sha256sums=('SKIP' 'SKIP' 'SKIP')
options=()

pkgver() {
  echo "3.8.0"
}

build() {
  mkdir -p libcxx_build
  cd       libcxx_build
  CC=clang CXX=clang++ cmake -G "Unix Makefiles" ../libcxx/ -DCMAKE_INSTALL_PREFIX=/usr/ -DLLVM_PATH=../llvm/ -DLIBCXX_CXX_ABI=libcxxabi -DLIBCXX_CXX_ABI_INCLUDE_PATHS=../libcxxabi/include/ ../libcxx/

  make cxx
}

check() {
    cd     libcxx_build
    # make check-libcxx
}

package() {
    cd     libcxx_build
    make DESTDIR="${pkgdir}" install
}
