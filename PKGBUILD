# Maintainer: TheGoliath
#
pkgname=sgminer
pkgver=5.6.1
pkgrel=1
pkgdesc="A multi-threaded multi-pool GPU miner for scrypt-based coins."
arch=('i686' 'x86_64')
url="https://github.com/nicehash/sgminer/"
license=('GPL3')
depends=('curl' 'ocl-icd' 'libtool' 'pkg-config' 'automake' 'autoconf')
makedepends=('opencl-headers')
optdepends=('ncurses5-compat: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
provides=('sgminer')
source_i686=(https://github.com/nicehash/sgminer/releases/download/${pkgver}/sgminer-${pkgver}-nicehash-51-linux-i386.zip)
source_x86_64=(https://github.com/nicehash/sgminer/releases/download/${pkgver}/sgminer-${pkgver}-nicehash-51-linux-amd64.zip)
sha512sums_i686=('0354a4cf25bf747435af12fe98b4c99cc9e7682bc5bf8b917897c2b3e3d0bb3838860a8d3667e4786ea34926ce7ed45b208978aa560e8f3ec7bd802272a77316')
sha512sums_x86_64=('19019fdf8da6e549c4fb81b06915ee810ea5110407209218e8a0206e76cde6240e1b4228179fa8836e711939037ab5138aeaa126a9a5c952ff7625cbc0d8828e')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"
    msg2 "You should consider using something different than this miner. It wasn't updated since 2015!"
    make DESTDIR="$pkgdir" install 
}
