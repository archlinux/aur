# Maintainer: dreieck
# Contributor: petRUShka

_pkgname="balongflash"
pkgname="${_pkgname}-git"
pkgver=r80.8bfe940
pkgrel=2
pkgdesc='Flashing utility for Huawei E3372 and other modems baesd on Balong v7'
arch=('i686' 'x86_64')
url="https://github.com/forth32/balongflash"
license=('GPLv3')
depends=()
makedepends=('git')
provides=("balongflash=${pkgver}")
conflicts=()
options=()

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("${_pkgname}::git+https://github.com/forth32/balongflash.git"
        'helpmessages_english.txt'::"http://ix.io/1RtB")
sha256sums=('SKIP'
            'd24d9ad7a03a7482ca675d624e39d6b5b8f1423f7137708cc9707f734d22971e')

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m755 balong_flash "${pkgdir}/usr/bin/balongflash"
    install -D -m644 "${srcdir}/helpmessages_english.txt" "${pkgdir}/usr/share/doc/balongflash/helpmessages_english.txt"
}
