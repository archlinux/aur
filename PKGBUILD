# Maintainer: Alexander Daum <alexander.daum@mailbox.org>

pkgname=vivado-board-alveo-u55c
pkgver=2024.2
pkgrel=1
pkgdesc="Board files for Alveo U55C Card for Vivado 2024.2"
url="https://www.amd.com/en/products/accelerators/alveo/u55c/a-u55c-p00g-pq-g.html"
arch=('x86_64')
license=('custom')

_card_name=au55c

depends=('vivado=2024.2')

source=('u55c.zip::https://www.xilinx.com/bin/public/openDownload?filename=au55c_boardfiles_v1_0_20211104.zip')

sha512sums=('14205699e6cc5dcc7245684d8547880a62fd1641f4d50f6105edef24757de12f96543235c788fa1821e4c62141ccf3a7d93cb9240aa118d6e8f486e3e68af88d')

# Prefix where Vivado is installed
_installprefix=/opt/Xilinx
# Use a Vendor other than Xilinx, in case Xilinx ever adds support for U55C directly in vivado
_vendor=Xilinx_ext

package() {
    install -dm755 "$pkgdir$_installprefix/Vivado/${pkgver}/data/xhub/boards/XilinxBoardStore/boards/$_vendor/$_card_name"
    for boardfile in "$srcdir"/$_card_name/1.0/*; do
        install -m644 -t "$pkgdir$_installprefix/Vivado/${pkgver}/data/xhub/boards/XilinxBoardStore/boards/$_vendor/$_card_name/" "$boardfile"
    done
}
