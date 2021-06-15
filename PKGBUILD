# Maintainer: Christian Bartz <christianbartz@gmail.com>
pkgname='pyxis'
pkgver='0.11.0'
pkgrel='1'
pkgdesc='Container plugin for Slurm Workload Manager'
arch=(x86_64)
url='https://github.com/NVIDIA/pyxis'
license=(Apache)
depends=(enroot slurm-llnl)
makedepends=(git gcc make libtool)
source=("https://github.com/NVIDIA/pyxis/archive/refs/tags/v${pkgver}.zip")
sha256sums=('40ee51ee765c53d34fa9195d145f31e87a44be7553635d2218ee5ab213ddfc1c')
install='pyxis.install'

build() {
    cd "pyxis-${pkgver}"
    CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
    cd "pyxis-${pkgver}"
    DESTDIR="$pkgdir/" make install prefix='/usr' exec_prefix=/usr 
}
