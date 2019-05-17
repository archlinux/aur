# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20190419
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
source=("https://sjp.pl/slownik/odmiany/sjp-odm-${pkgver}.zip")
md5sums=('4683ae23d5b98faf9711549e0f17592d')
sha256sums=('47bb9eb97e8a286979e1de2a050d110adf47cb1015b1524bad90ff88983719d8')

build() {
    cd "${srcdir}"
    grep -v '^\?' odm.txt | sed 's/, /\n/g' > polish
    dos2unix polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
