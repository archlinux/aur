# Maintainer: Ascend Liu<ascendliu@qq.com>

pkgname=libft4222
pkgver=1.4.4.221
pkgrel=1
pkgdesc="Library for FT4222HQ – USB 2.0 to Quad SPI / I2C Bridge IC"
arch=('x86_64')
url="https://ftdichip.com/products/ft4222h/"
license=('custom')
source=("https://ftdichip.com/wp-content/uploads/2025/02/libft4222-linux-1.4.4.221.zip")
sha256sums=('SKIP')
options=(staticlibs)
makedepends=('unzip' 'tar')

prepare() {
    unzip "${pkgname}-linux-${pkgver}.zip"

    mkdir "${pkgname}-linux-${pkgver}"

    tar -xzf "${pkgname}-linux-${pkgver}.tgz" -C "${pkgname}-linux-${pkgver}"
}

package() {

    cd "${pkgname}-linux-${pkgver}"

    platform="x86_64"

    # 安装动态库
    pathToLib=$(ls build-$platform/libft4222.so.*)
    Lib=$(basename "$pathToLib")
    install -Dm755 "$pathToLib" "${pkgdir}/usr/lib/$Lib"

    # 创建符号链接
    ln -sf "/usr/lib/$Lib" "${pkgdir}/usr/lib/libft4222.so"

    # 安装静态库
    pathToLibStatic=$(ls build-$platform/libft4222.a)
    install -Dm644 "$pathToLibStatic" "${pkgdir}/usr/lib/libft4222.a"

    echo "Copying headers to /usr/include"
    # 安装头文件
    install -Dm644 libft4222.h "${pkgdir}/usr/include/libft4222.h"

    #文件如果已存在则跳过
    # install -CDm644 ftd2xx.h "${pkgdir}/usr/local/include/ftd2xx.h"
    # install -CDm644 WinTypes.h "${pkgdir}/usr/local/include/WinTypes.h"


}
