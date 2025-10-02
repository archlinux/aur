# Maintainer: lucas007 <lucaszhou007@163.com>

pkgname=finalshell
pkgver=4.6.4
pkgrel=1
pkgdesc="FinalShell是一体化的的服务器、网络管理软件，不仅是ssh客户端，还是功能强大的开发、运维工具，充分满足开发、运维需求。"
url="https://www.hostbuf.com/"
arch=("x86_64" "aarch64" "loong64")
license=('custom')
provides=('FinalShell')
makedepends=("rsync")
source=('FinalShell.desktop')
sha256sums=('3aa0a806f4fd3cdb5a8065226dc779f1915d5535e8bdec64fb7967698a693ed0')

source_x86_64=('https://dl.hostbuf.com/finalshell3/finalshell_linux_x64.deb')
source_aarch64=('https://dl.hostbuf.com/finalshell3/finalshell_linux_arm64.deb')
source_loong64=('https://dl.hostbuf.com/finalshell3/finalshell_linux_loong64.deb')
sha256sums_x86_64=('71d1326da3a864c6e5c64694ac669fb9b0870b175566bf8008e90fedd5aea90d')
sha256sums_aarch64=('06779669866b05c054fb9edd90efaf6768841d12c7f0839af28b0e9957b298d5')
sha256sums_loong64=('108b81abc1cd7afccd08025457871e1234e57c0f9a53330a00b354024840c43a')

prepare() {
    tar -Jxf data.tar.xz
    tar -Jxf control.tar.xz
}

pkgver() {
    printf $(grep Version control | awk '{print $2}')
}

package() {
    install -Dm644 "${srcdir}/usr/lib/finalshell/lib/FinalShell.png"     "${pkgdir}/usr/share/icons/hicolor/scalable/apps/FinalShell.png"
    install -Dm644 "${srcdir}/FinalShell.desktop" "${pkgdir}/usr/share/applications/FinalShell.desktop"
    rm -rf "${srcdir}/usr/lib/finalshell/lib/FinalShell.png" "${srcdir}/usr/lib/finalshell/lib/finalshell-FinalShell.desktop"

    install -dm755 "${pkgdir}/usr/lib"
    rsync -rq --delete "${srcdir}/usr/lib/finalshell" "${pkgdir}/usr/lib"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/finalshell/bin/FinalShell" "${pkgdir}/usr/bin/FinalShell"
}