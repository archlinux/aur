# Maintainer: Gimo <self@gimo.me>
pkgname=mecab-ipadic-neologd-git
pkgver=r20180921
pkgrel=3
pkgdesc="Neologism dictionary for MeCab"
arch=('any')
url="https://github.com/neologd/mecab-ipadic-neologd"
license=('Apache')
depends=('mecab')
makedepends=('git' 'mecab-ipadic')

prepare() {
    git clone --single-branch --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git "$srcdir/${pkgname%-git}"
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s" "$(git log -1 --format=%cd --date=format:%Y%m%d)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    ./bin/install-mecab-ipadic-neologd -p "$pkgdir$(mecab-config --dicdir)/${pkgname%-git}" -n -u -y
}
