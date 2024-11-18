#Maintainer lucas007 <lucaszhou007@163.com>

pkgname=finalshell
pkgver=4.5.12
pkgrel=1
pkgdesc="FinalShell是一体化的的服务器,网络管理软件,不仅是ssh客户端,还是功能强大的开发,运维工具,充分满足开发,运维需求."
url="https://www.hostbuf.com/"
arch=("x86_64" "aarch64" "loong64")
license=('custom')
provides=('FinalShell')
makedepends=("rsync")
source_x86_64=('https://dl.hostbuf.com/finalshell3/finalshell_linux_x64.deb'
        'FinalShell.desktop')
source_aarch64=('https://dl.hostbuf.com/finalshell3/finalshell_linux_arm64.deb'
        'FinalShell.desktop')
source_loong64=('https://dl.hostbuf.com/finalshell3/finalshell_linux_loong64.deb'
        'FinalShell.desktop')
sha256sums_x86_64=('2f854b8670ada37f3f416755c904f2e50de58f4c0725a6a651d0bc376cce5ed8'
                   '3aa0a806f4fd3cdb5a8065226dc779f1915d5535e8bdec64fb7967698a693ed0')
sha256sums_aarch64=('f12b6c7fd57399cc71ca0d7d5c0b20877aa809fdffa2ede985e994ce2742e1c8'
                    '3aa0a806f4fd3cdb5a8065226dc779f1915d5535e8bdec64fb7967698a693ed0')
sha256sums_loong64=('877942f5f17885e2e1a4152188ec809a84046464b3b76574f033106e85a8c17f'
                    '3aa0a806f4fd3cdb5a8065226dc779f1915d5535e8bdec64fb7967698a693ed0')

prepare() {
    tar -Jxf data.tar.xz
}

package() {
    install -Dm644 usr/lib/finalshell/lib/FinalShell.png     "$pkgdir/usr/share/icons/hicolor/scalable/apps/FinalShell.png"
    install -Dm644 FinalShell.desktop "$pkgdir/usr/share/applications/FinalShell.desktop"
    rm -rf usr/lib/finalshell/lib/FinalShell.png usr/lib/finalshell/lib/finalshell-FinalShell.desktop

    install -dm755 "$pkgdir/usr/lib"
    rsync -rq --delete $srcdir/usr/lib/finalshell "$pkgdir/usr/lib"

    install -dm755 "$pkgdir/usr/bin"
    ln -sf "${pkgdir}/usr/lib/finalshell/bin/FinalShell" "${pkgdir}/usr/bin/FinalShell"
}