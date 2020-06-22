# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20200619
pkgrel=2
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
source=("http://web.archive.org/web/20200622191725/https://sjp.pl/slownik/odmiany/sjp-odm-20200619.zip")
md5sums=('ef0d443a89d7f2a72564591128e0e04b')
sha256sums=('7684a4e27fb24d460561da6a0f19bb92ccf3215c49c3334f0d1295c84c83cee8')

build() {
    cd "${srcdir}"
    grep -v '^\?' odm.txt | sed 's/, /\n/g' > polish
    dos2unix polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
