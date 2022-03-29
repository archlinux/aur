# Maintainer: Ben <bensongsyz@gmail.com>
pkgname='wudao-dict-git'
_pkgname='Wudao-dict'
pkgver=r18.caceb83
pkgrel=1
pkgdesc='The command line version of Youdao Dictionary, supporting English-Chinese mutual search and online search.'
arch=('any')
url="https://github.com/ChestnutHeng/Wudao-dict"
license=('unknown')
depends=('python' 'python-bs4' 'python-lxml')
install="wudao-dict-git.install"
makedepends=('git')
source=('git+https://github.com/ChestnutHeng/Wudao-dict.git'
        'wd')
md5sums=('SKIP'
        '7e504991b277c83136466f885626cd7c')
pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "./Wudao-dict/wudao-dict" "${pkgdir}/opt/"

    # 添加系统命令wd
    mkdir -p "${pkgdir}/usr/bin"
    cp ./wd "${pkgdir}/usr/bin"

    # 添加bash_completion自动补全
    mkdir -p "${pkgdir}/etc/bash_completion.d"
    ln -s /opt/wudao-dict/wd_com "${pkgdir}/etc/bash_completion.d/wd"
}
