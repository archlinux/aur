# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.11
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
sha256sums=('101dbb13cb3320ee76525ec26426f2aa1de4e3ee5af74f79cb403ae4d2c6c871')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

