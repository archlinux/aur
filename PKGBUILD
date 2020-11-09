# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurutils
pkgver=3.1.1
pkgrel=1
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.signify"
        'aurutils.pub')
changelog=aurutils.changelog
sha256sums=('90f46ae991ffd7737ab2d95dc78718c62202df5524cbdfa83916015dde3d922d'
            'SKIP'
            'a2c32b0dba4da40b83ff31cce48a00faed5ed2f663c060a865d31caeb1e4ed39')
depends=('git' 'jq' 'pacutils' 'curl')
makedepends=('signify')
optdepends=('bash-completion: bash completion'
            'zsh: zsh completion'
            'devtools: aur-chroot'
            'vifm: default pager')

prepare() {
    signify -V -p aurutils.pub -m "$pkgname-$pkgver".tar.gz \
            -x "$pkgname-$pkgver".tar.gz.signify
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
