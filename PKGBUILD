# Maintainer: Christian Bartz <christianbartz [ätt] gmail [döt] com>
pkgname='pyxis'
pkgver='0.13.0'
pkgrel='1'
pkgdesc='Container plugin for the Slurm Workload Manager'
arch=(x86_64)
url='https://github.com/NVIDIA/pyxis'
license=(Apache)
depends=(enroot slurm-llnl)
makedepends=(git gcc make libtool)
source=("https://github.com/NVIDIA/pyxis/archive/refs/tags/v${pkgver}.zip")
sha256sums=('09ceb63c5d57cdd87c13bac4ca69823007e4f4f0249bff1fca7af91b61fc466b')
install='pyxis.install'

build() {
    cd "pyxis-${pkgver}"
    CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
    cd "pyxis-${pkgver}"
    DESTDIR="$pkgdir/" make install prefix='/usr' exec_prefix=/usr 
}
