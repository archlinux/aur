# Prev Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=man-pages-ja
pkgver=20230915
pkgrel=1
pkgdesc="Man pages for Japanese"
arch=('any')
url="https://linuxjm.osdn.jp"
license=('custom')
optdepends=('mandoc: makewhatis support')
makedepends=('perl')
conflicts=('man-pages-ja-git')
install="${pkgname}.install"
source=("https://linuxjm.osdn.jp/man-pages-ja-${pkgver}.tar.gz")
md5sums=('15b1da5ca0c58fc33728076b4bbad25c')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cp script/configure.perl script/configure.perl.org

    cat script/configure.perl.org                |
    sed '/until/i$ans = "y";'                    |
    sed "/usr[/]share[/]man[/]/s@/@${pkgdir}/@1" > script/configure.perl
    sed -i 's/$LANG/ja_JP.UTF-8/g' script/configure.perl
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    yes '' | make config
}

package() {
    mkdir -p ${pkgdir}/usr/share/man/ja_JP.UTF-8
    cd ${srcdir}/${pkgname}-${pkgver}
    make install
}
