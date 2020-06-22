# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20200619
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
source=("http://web.archive.org/web/20200622191725/https://sjp.pl/slownik/odmiany/sjp-odm-20200619.zip")
md5sums=('6504cc1e2cd36131e3c4aa14efecd2c1')
sha256sums=('e5e77f63cb6b31938e8ff7cef73a418e776e5d0ff4daf11ab43a63a654bc52bd')

build() {
    cd "${srcdir}"
    grep -v '^\?' odm.txt | sed 's/, /\n/g' > polish
    dos2unix polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
