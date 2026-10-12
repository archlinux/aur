# Maintainer: Your Name <your.email@example.com>
pkgname=xjtutoolbox-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="XJTUToolBox - A powerful utility tool (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('GPL3')
provides=('xjtutoolbox')
conflicts=('xjtutoolbox')
depends=('glibc')

# 区分不同架构下载对应的 zst 包
source_x86_64=("https://github.com/yan-xiaoo/XJTUToolBox/releases/download/v${pkgver}/XJTUToolbox-linux-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/yan-xiaoo/XJTUToolBox/releases/download/v${pkgver}/XJTUToolbox-linux-arm64.pkg.tar.zst")

sha256sums_x86_64=('008afe44959c46a2d84c7f49849581c4bd6e683fea09d298354c7c8a17e1dbfd')
sha256sums_aarch64=('c0d19416a66b1bfeb688b3294b12949477251dc0924364fbf7ce85358d030119')

package() {
    # pacman 包本质上也是 tar 压缩包，bsdtar 会自动将它解压到 srcdir
    # 我们只需要把它里面的 opt 和 usr 目录原封不动搬进系统即可
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"
    
    # 移除被带进来的、属于原 pacman 包的元数据文件，防止冲突
    rm -f "${pkgdir}/.PKGINFO" "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE"
}
