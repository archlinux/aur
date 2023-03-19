# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=maxcso-git
pkgver=1.13.0.r26.2a26a153
pkgrel=1
pkgdesc='A fast ISO to CSO compression program for use with PSP and PS2 emulators'
arch=(x86_64)
url=https://github.com/unknownbrackets/maxcso
license=(custom:ISCL)
depends=(
  gcc-libs
  glibc
#  libdeflate.so
  libuv
#  libzopfli.so
  lz4
  zlib
)
makedepends=(git)
provides=("${pkgname/%-git/}")
conflicts=("${pkgname/%-git/}")
source=(
  git+https://github.com/unknownbrackets/maxcso.git
  maxcso-system-flags.patch
  maxcso-system-libs.patch
)
b2sums=('SKIP'
        '5619e8dcc204dd130f724fb7f08009cfad5d122ffbafa42fe64e3776fd4a25894d9a6a0333192b091bdcf0051e5e4f8cb1f9bf177294d6e822440ac9baa8b23a'
        '9f136c8091ad19b842e02e74e780b1e865afe2e71af010c58e28cb23a79e6d8470eb049a8c571588266c597dbdd525ce5999fe71c6f1aec41d6c4d32cf71d983')

prepare() {
  cd maxcso
#  patch -Np1 -i ../maxcso-system-flags.patch
#  patch -Np1 -i ../maxcso-system-libs.patch
}

pkgver() {
  cd maxcso
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  make PREFIX=/usr -C maxcso
}

package() {
  make DESTDIR="${pkgdir}" PREFIX=/usr -C maxcso install
  install -Dm 644 maxcso/README{,_CSO,_ZSO}.md -t "${pkgdir}"/usr/share/doc/maxcso/
  install -Dm 644 maxcso/LICENSE.md -t "${pkgdir}"/usr/share/licenses/maxcso/
}

#vim: ts=2 sw=2 et:
