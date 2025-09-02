# Maintainer: John Eivind Helset <private@jehelset.no>

_name=cpptrace
_author=jeremy-rifkin

pkgname=${_name}
pkgver=1.0.4
pkgrel=1
pkgdesc="Simple, portable, and self-contained stacktrace library for C++11 and newer"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=('zstd' 'libdwarf' 'libunwind')
makedepends=('git' 'cmake' 'make' 'zstd' 'libdwarf' 'pkgconf' 'libunwind')
provides=('cpptrace')
conflicts=('cpptrace')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cmake -B build                                  \
          -DBUILD_SHARED_LIBS=1                     \
          -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"    \
          -DCPPTRACE_USE_EXTERNAL_ZSTD=1            \
          -DCPPTRACE_USE_EXTERNAL_LIBDWARF=1        \
          -DCPPTRACE_STD_FORMAT=1                   \
          -DCPPTRACE_STATIC_DEFINE=0                \
          -DCPPTRACE_UNWIND_WITH_LIBUNWIND=1        \
          -DCPPTRACE_FIND_LIBDWARF_WITH_PKGCONFIG=1 \
          -S ${pkgname}
}

package() {
    cmake --build build --target install
}
