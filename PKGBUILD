# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.16
pkgrel=1
pkgdesc="Function graph tracer for C/C++/Rust"
arch=('x86_64')
url="https://github.com/namhyung/uftrace"
license=('GPL-2.0-only')
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
sha256sums=('dd0549f610d186b6f25fa2334a5e82b6ddc232ec6ca088dbb41b3fe66961d6bb')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

