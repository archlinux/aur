# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20210427
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
source=("http://web.archive.org/web/20210604075633/https://sjp.pl/slownik/odmiany/sjp-odm-20210427.zip")
md5sums=('8498c4ac867f5b8a7d62f8dc35c510c1')
sha256sums=('487baf52dca4bf34b0cf86c78be221ffc725f66cdeb406c79cad76c0440be469')

build() {
    cd "${srcdir}"
    dos2unix odm.txt
    grep -v '^\?' odm.txt | sed 's/, /\n/g' | sort > polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
