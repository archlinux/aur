# Maintainer: Ben <bensongsyz@gmail.com>
pkgname='wudao-dict-git'
pkgver=r24.7267fbd
pkgrel=1
pkgdesc='The command line version of Youdao Dictionary, supporting English-Chinese mutual search and online search.'
arch=('any')
url="https://github.com/ChestnutHeng/Wudao-dict"
license=('unknown')
depends=('python' 'python-beautifulsoup4' 'python-lxml')
install="wudao-dict-git.install"
makedepends=('git')
source=("$pkgname::git+https://github.com/ChestnutHeng/Wudao-dict"
        'wd')
md5sums=('SKIP'
        '4e61df0c22c14fc8a7a8950a9c42d9d2')
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "./$pkgname/wudao-dict" "${pkgdir}/opt/"

    # 添加系统命令wd
    mkdir -p "${pkgdir}/usr/bin"
    cp ./wd "${pkgdir}/usr/bin"

    # 添加bash_completion自动补全
    mkdir -p "${pkgdir}/etc/bash_completion.d"
    ln -s /opt/wudao-dict/wd_com "${pkgdir}/etc/bash_completion.d/wd"
}
