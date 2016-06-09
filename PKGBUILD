pkgname=libc++abi-3.8.0
pkgver=3.8.0
pkgrel=1
pkgdesc="LLVM libc++abi-3.8.0"
arch=('i686' 'x86_64')
url="https://libcxxabi.llvm.org/"
license=('MIT' 'NCSA')
depends=('clang')
makedepends=('subversion')
checkdepends=()
provides=('libc++abi')
conflicts=('libc++abi')
source=('llvm/::svn+https://llvm.org/svn/llvm-project/llvm/tags/RELEASE_380/final/'
        'libcxx/::svn+https://llvm.org/svn/llvm-project/libcxx/tags/RELEASE_380/final/'
        'libcxxabi/::svn+https://llvm.org/svn/llvm-project/libcxxabi/tags/RELEASE_380/final/')
sha256sums=('SKIP' 'SKIP' 'SKIP')
options=()

pkgver() {
  echo "3.8.0"
}

build() {
  mkdir -p libcxxabi_build
  cd       libcxxabi_build
  CC=clang CXX=clang++ cmake -G "Unix Makefiles" ../libcxx/ -DCMAKE_INSTALL_PREFIX=/usr/ -DLLVM_PATH=../llvm/ -DLIBCXXABI_LIBCXX_PATH=../libcxx/ ../libcxxabi/

  make cxxabi
}

check() {
    cd     libcxxabi_build
    # make check-libcxx
}

package() {
    cd     libcxxabi_build
    make DESTDIR="${pkgdir}" install
}
