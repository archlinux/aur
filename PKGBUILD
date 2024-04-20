# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=rime-latex-git
pkgver=r31.d484bf6
pkgrel=1
provides=('rime-latex')
conflicts=('rime-latex')
pkgdesc='Rime Latex 数学符号输入方案'
arch=('any')
url='https://github.com/shenlebantongying/rime_latex'
_reponame="${url##*/}"
license=('GPL-3.0-only')
makedepends=('git' 'librime')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_reponame"
    rime_deployer --compile latex.schema.yaml . /usr/share/rime-data
    rm build/*.txt
}

package() {
    cd "$_reponame"
    install -Dm644 ./*.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
