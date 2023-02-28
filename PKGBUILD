# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.13.1
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
source=("uftrace-v${pkgver}.tar.gz"::"https://github.com/namhyung/uftrace/archive/v${pkgver}.tar.gz")
# Use updpkgsums to update the checksum
sha256sums=('88b59923fdd9804fd29da8a784cd1b39837b1b735fc3be4165b3932eca3661ad')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

