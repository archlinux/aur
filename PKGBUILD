# Maintainer: Mirh <mirh@protonmail.ch>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: Enihcam <gmail n a n e r i c w a n g>
#
# Get the Ubuntu tarball from https://developer.codeplay.com/products/computecpp/ce/download
pkgname=computecpp
pkgver=1.2.0
pkgrel=1
pkgdesc="Accelerates Complex C++ Applications on Heterogeneous Compute 
Systems using Open Standards"
arch=('x86_64')
url="https://www.codeplay.com/products/computesuite/computecpp"
license=('EULA')
source=("https://computecpp.codeplay.com/downloads/computecpp-ce/${pkgver}/ubuntu-16.04-64bit.tar.gz")
sha256sums=('d070f7c6b0f17bc55cc80a6cc7564f4661fd3fb62642106a944bb5bc6342a0b9')
depends=(ncurses5-compat-libs opencl-driver ocl-icd)
options=(!strip)

package() {
    _pkgbasename=ComputeCpp-CE-${pkgver}-Ubuntu-16.04-${arch}
    cd "$srcdir"
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc/ld.so.conf.d"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

    mv ${_pkgbasename}/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname"
    mv ${_pkgbasename} "$pkgdir/opt"

    ln -s /opt/${_pkgbasename}/bin/compute++ "$pkgdir/usr/bin"
    ln -s /opt/${_pkgbasename}/bin/computecpp_info "$pkgdir/usr/bin"
    ln -s /opt/${_pkgbasename}/bin/spirv-ll-tool "$pkgdir/usr/bin"
    ln -s /opt/${_pkgbasename} "$pkgdir/opt/ComputeCpp-CE"

    echo /opt/${_pkgbasename}/lib > "$pkgdir/etc/ld.so.conf.d/computecpp.conf"
}
