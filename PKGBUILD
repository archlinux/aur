# Maintainer: Christian Bartz <christianbartz@gmail.com>
pkgname='pyxis'
pkgver='0.9.1'
pkgrel='1'
pkgdesc='Container plugin for Slurm Workload Manager'
arch=(x86_64)
url='https://github.com/NVIDIA/pyxis'
license=(Apache)
# depends=(enroot slurm-llnl)
makedepends=(git gcc make libtool)
source=("https://github.com/NVIDIA/pyxis/archive/refs/tags/v${pkgver}.zip")
sha256sums=('8e46510d9af976ddb52abcd07f62b3f07d46d39fa537fea0ca16847074c285e2')
install='pyxis.install'

build() {
    cd "pyxis-${pkgver}"
    CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
    cd "pyxis-${pkgver}"
    DESTDIR="$pkgdir/" make install prefix='/usr' exec_prefix=/usr 
}
