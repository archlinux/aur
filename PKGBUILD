# Maintainer: Olaf Leidinger <oleid@mescharet.de>
#
# Get the Ubuntu tarball from https://www.codeplay.com/products/computesuite/computecpp/download
pkgname=computecpp
pkgver=0.4.0
pkgrel=1
pkgdesc="Accelerates Complex C++ Applications on Heterogeneous Compute 
Systems using Open Standards"
arch=('x86_64')
url="https://www.codeplay.com/products/computesuite"
license=('EULA')
source=("local://ComputeCpp-CE-${pkgver}-Ubuntu.16.04-64bit.tar.gz")
sha256sums=('acb4985b7d79fb52182af0b6816164ee54a0566865721b2924ccbd98f63eb468')
depends=(ncurses5-compat-libs)
options=(!strip)

package() {
    _pkgbasename=ComputeCpp-CE-${pkgver}-Ubuntu-16.04-64bit
    cd "$srcdir"
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc/ld.so.conf.d"

    mv ${_pkgbasename} "$pkgdir/opt"

    ln -s /opt/${_pkgbasename}/bin/compute++ "$pkgdir/usr/bin"
    ln -s /opt/${_pkgbasename}/bin/computecpp_info "$pkgdir/usr/bin"
    ln -s /opt/${_pkgbasename} "$pkgdir/opt/ComputeCpp-CE"

    echo /opt/${_pkgbasename}/lib > "$pkgdir/etc/ld.so.conf.d/computecpp.conf"
}
