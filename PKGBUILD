# Maintainer: Christian Bartz <christianbartz@gmail.com>
pkgname='pyxis'
pkgver='0.10.0'
pkgrel='1'
pkgdesc='Container plugin for Slurm Workload Manager'
arch=(x86_64)
url='https://github.com/NVIDIA/pyxis'
license=(Apache)
# depends=(enroot slurm-llnl)
makedepends=(git gcc make libtool)
source=("https://github.com/NVIDIA/pyxis/archive/refs/tags/v${pkgver}.zip")
sha256sums=('2ab24114726d09f6c4d62ffc18538891c836d41acea8b60def8f105670ba3804')
install='pyxis.install'

build() {
    cd "pyxis-${pkgver}"
    CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
    cd "pyxis-${pkgver}"
    DESTDIR="$pkgdir/" make install prefix='/usr' exec_prefix=/usr 
}
