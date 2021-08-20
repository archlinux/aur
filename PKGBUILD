# Maintainer: Christian Bartz <christianbartz [ätt] gmail [döt] com>
pkgname='pyxis'
pkgver='0.11.1'
pkgrel='1'
pkgdesc='Container plugin for the Slurm Workload Manager'
arch=(x86_64)
url='https://github.com/NVIDIA/pyxis'
license=(Apache)
depends=(enroot slurm-llnl)
makedepends=(git gcc make libtool)
source=("https://github.com/NVIDIA/pyxis/archive/refs/tags/v${pkgver}.zip")
sha256sums=('2d754a34cb2329d3ee5ad735c74c3c0df78873e2a6d5af0abca573ec277c7935')
install='pyxis.install'

build() {
    cd "pyxis-${pkgver}"
    CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
    cd "pyxis-${pkgver}"
    DESTDIR="$pkgdir/" make install prefix='/usr' exec_prefix=/usr 
}
