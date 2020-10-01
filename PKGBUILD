# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=fpga-toolchain-bin
pkgver=20200930
pkgrel=1
pkgdesc="Nightly builds of open-source FPGA tools"
arch=('x86_64')
url="https://github.com/open-tool-forge/fpga-toolchain"
license=('GPL3')
depends=('python' 'bash')
conflicts=(
    'yosys'
    'ghdl-yosys-plugin'
    'ghdl'
    'trellis'
    'icestorm'
    'nextpnr'
    'dfu-util' 'dfu-util-git'
    'ecpprog'
    'openfpgaloader'
    )
source_x86_64=($url/releases/download/nightly-$pkgver/fpga-toolchain-linux_x86_64-nightly-$pkgver.tar.xz)
sha256sums_x86_64=('f85208b6b70805ff260c6aa3e6b60ccc68c121faa5ffa13d8a768abf30e8f7fd')
package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include" "$pkgdir/usr/lib/ghdl" "$pkgdir/usr/share"
    rsync -a "$srcdir/fpga-toolchain/" "$pkgdir/usr/" --chmod=755 --exclude lib/python3.8 --exclude VERSION --exclude lib/libghdl.link
    chmod 644 "$pkgdir/usr/lib/libghdl.a"
}
