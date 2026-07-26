# Maintainer:tmdp6k <mc469617638@outlook.com>
# Maintainer:bilibili_xiaok <the_xiaok@qq.com>
pkgname=bilibili-deb-bin
_pkgname=io.github.msojocs.bilibili
pkgver=1.17.9
pkgrel=3
pkgdesc='基于哔哩哔哩官方客户端移植的Linux版本支持漫游(DEB构建相较bilibili-bin更快更新修复输入法问题) '
options=('!strip' '!debug' '!emptydirs')
arch=('x86_64' 'aarch64')
url='https://github.com/msojocs/bilibili-linux/'
license=('MIT License')
depends=(electron ffmpeg libappindicator libinput)
source_x86_64=(https://github.com/msojocs/bilibili-linux/releases/download/v1.17.9-2/${_pkgname}_${pkgver}-2_amd64.deb)
source_aarch64=(https://github.com/msojocs/bilibili-linux/releases/download/v1.17.9-2/${_pkgname}_${pkgver}-2_arm64.deb)
sha256sums_x86_64=('207f589cca0ed998093cc99b179b83b9ca45b3d0d061308170a66c832ce6d24f')
sha256sums_aarch64=('8985e6b7f4908157e4b0ba535331088e3c0d72d3f55355f924a00cdb5967c235')
package() {
    cd "$srcdir"
    if [[ $(uname -m) == "aarch64" ]]; then
    ar x "${_pkgname}_${pkgver}-2_arm64.deb"
    else
    ar x "${_pkgname}_${pkgver}-2_amd64.deb"
    fi
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "$pkgdir"
    cd ./opt/apps/io.github.msojocs.bilibili/files/bin
    rm -rf electron
    cd bin
    sed -i 's|"\$root_dir/electron/electron"|electron|g' bilibili
   
}
