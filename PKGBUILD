# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20211220
pkgrel=1
pkgdesc="A ‘words’ file for Polish language"
arch=("any")
url="https://sjp.pl/slownik/odmiany/"
license=("GPL" "LGPL" "Apache" "CCPL")
depends=()
optdepends=()
makedepends=("dos2unix")
conflicts=("${pkgname}")
# install=$pkgname.install
# source=("https://sjp.pl/slownik/odmiany/sjp-odm-${pkgver}.zip")
source=("https://web.archive.org/web/20220201135244/https://sjp.pl/slownik/odmiany/sjp-odm-20211220.zip")
sha256sums=('6be8da3a9869f12013c1836574ff8fc7661a3cc558fcb86ecf3ba52720650309')

build() {
    cd "${srcdir}"
    dos2unix odm.txt
    grep -v '^\?' odm.txt | sed 's/, /\n/g' | sort -u > polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
