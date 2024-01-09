# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.15
pkgrel=1
pkgdesc="Function graph tracer for C/C++/Rust"
arch=('x86_64')
url="https://github.com/namhyung/uftrace"
license=('GPL2')
depends=(
  'libelf'
  'python'
  'ncurses'
  'luajit'
  'capstone'
  'libunwind'
  'libtraceevent'
)
makedepends=(
  'pkgconf'
  'pandoc'
)
# Disable LTO due to upstream issue
# https://github.com/namhyung/uftrace/issues/1343
options=('!lto')
source=("uftrace-v${pkgver}.tar.gz"::"https://github.com/namhyung/uftrace/archive/v${pkgver}.tar.gz")
# Use updpkgsums to update the checksum
sha256sums=('c4f2a45687fd39dbde509635ebf094d7ed301793920f37bcaabb8161ff69f2fd')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

