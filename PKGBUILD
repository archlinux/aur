# Maintainer: fenuks
# TODO: check if using https://sjp.pl/slownik/ort/ won't be better idea

pkgname=words-pl
pkgver=20170729
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
md5sums=('3b85dfeeeecb7ead69124e2e5367b8bb')
sha256sums=('f9bdb5cee88e755d2c35c9f2f11510bee3317e3a3dda0e302b1feb959c03fd66')

build() {
    cd "${srcdir}"
    grep -v '^\?' odm.txt | sed 's/, /\n/g' > polish
    dos2unix polish
}

package() {
    cd "${srcdir}"
    install -Dm644 polish "$pkgdir/usr/share/dict/polish"
}
