# Maintainer: Mirh <mirh@protonmail.ch>
# Co-Maintainer : sysgen <sgsn@protonmail.ch>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: Enihcam <gmail n a n e r i c w a n g>
#
# Get the Ubuntu tarball from https://developer.codeplay.com/products/computecpp/ce/download
pkgname=computecpp
pkgver=2.11.0
pkgrel=1
pkgdesc="Accelerates Complex C++ Applications on Heterogeneous Compute 
Systems using Open Standards"
arch=('x86_64')
url="https://www.codeplay.com/products/computesuite/computecpp"
license=('EULA')
source=("https://computecpp.codeplay.com/downloads/computecpp-ce/2.11.0/x86_64-linux-gnu.tar.gz")
sha256sums=('5383b8939fd60c3df4c71c7b8d9321057a27894428ece1437c9d6ab3138ef9ef')
depends=(ncurses5-compat-libs opencl-driver ocl-icd)
options=(!strip)

package() {
    _pkgbasename=ComputeCpp-CE-2.11.0-x86_64-linux-gnu
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
