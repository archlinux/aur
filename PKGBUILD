# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.13
pkgrel=1
pkgdesc="Function graph tracer for C/C++/Rust"
arch=('x86_64')
url="https://github.com/namhyung/uftrace"
license=('GPL2')
depends=('libelf' 'python' 'ncurses' 'pkgconf' 'luajit' 'capstone' 'libunwind')
makedepends=('pandoc')
# Disable LTO due to upstream issue
# https://github.com/namhyung/uftrace/issues/1343
options=('!lto')
source=("https://github.com/namhyung/uftrace/archive/v$pkgver.tar.gz")
# Use updpkgsums to update the checksum
sha256sums=('cffae82c68446c20cc3c7e87e71e57498805767a0d4085b4846f3c49f9e472d9')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

