# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20240115
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
source=("https://web.archive.org/web/20240120124250/https://sjp.pl/sl/odmiany/sjp-odm-20240115.zip")
sha256sums=('90a9ce060f06c42dd04a349ab06470a6d3ff53a493b395548f140b28049da73f')

build() {
    cd "${srcdir}"
    dos2unix odm.txt
    grep -v '^?' odm.txt | sed 's/, /\n/g' | sort -u > polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
