# Maintainer: "UnCO Lin" <trash__box <at> 163.com>
# Contributor: PLum <plum.michalski <at> gmail.com>
pkgname=pcompress-git
_pkgname=pcompress
pkgver=405
_wavpack_ver=4.70.0
pkgrel=1
arch=(x86_64)
pkgdesc="Pcompress is a utility to do compression/decompression and deduplication in parallel by splitting input data into chunks."
url="http://moinakg.github.io/pcompress/"
license=('LGPL v3')
options=('!makeflags')
depends=('glibc' 'gcc-libs-multilib' 'bzip2' 'zlib' 'openssl')
makedepends=('yasm')
source=("git+https://github.com/moinakg/${_pkgname}.git"
        "http://wavpack.com/wavpack-${_wavpack_ver}.tar.bz2")
md5sums=('SKIP'
         '4c0186ef0dc8367ce5cd7cc0f398b714')

pkgver() {
  cd "$_pkgname"
  git rev-list --count HEAD
}

prepare() {
  cd "$_pkgname"
}

build() {
  cd "$_pkgname"
  ./config --prefix=/usr \
    --wavpack-dir="$srcdir"/wavpack-${_wavpack_ver}
  make -j1
}

package() {
  cd "$_pkgname"
  make DESTDIR=${pkgdir} install
}
