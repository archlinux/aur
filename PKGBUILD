# Maintainer:tmdp6k <mc469617638@outlook.com>
# Maintainer:bilibili_xiaok <the_xiaok@qq.com>
pkgname=bilibili-deb-bin
_pkgname=io.github.msojocs.bilibili
pkgver=1.17.9
pkgrel=2
pkgdesc='基于哔哩哔哩官方客户端移植的Linux版本支持漫游(DEB构建相较bilibili-bin更快更新修复输入法问题) '
options=('!strip' '!debug' '!emptydirs')
arch=('x86_64' 'aarch64')
url='https://github.com/msojocs/bilibili-linux/'
license=('MIT License')
depends=(electron ffmpeg libappindicator libinput)
source_x86_64=(https://github.com/msojocs/bilibili-linux/releases/download/v1.17.9-1/${_pkgname}_${pkgver}-1_amd64.deb)
source_aarch64=(https://github.com/msojocs/bilibili-linux/releases/download/v1.17.9-1/${_pkgname}_${pkgver}-1_arm64.deb)
sha256sums_x86_64=('7a4ed7930581afa771ee557dc72ffe4a5e083446d2bb983f59a3c41d4e05187e')
sha256sums_aarch64=('c534466a9952a56f9ac7bfe1247c46abff16def6c9174b986d7b16d43974e019')
package() {
    cd "$srcdir"
    if [[ $(uname -m) == "aarch64" ]]; then
    ar x "${_pkgname}_${pkgver}-1_arm64.deb"
    else
    ar x "${_pkgname}_${pkgver}-1_amd64.deb"
    fi
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "$pkgdir"
    cd ./opt/apps/io.github.msojocs.bilibili/files/bin
    rm -rf electron
    cd bin
    sed -i 's|"\$root_dir/electron/electron"|electron|g' bilibili
   
}
