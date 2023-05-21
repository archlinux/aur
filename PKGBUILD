# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=fortune-mod-ibash
pkgver=2022.10
pkgrel=4
pkgdesc="A collection of quotes for fortune-mod from http://ibash.org.ru"
url="http://ibash.org.ru"
license=("unknown")
makedepends=('git' 'python' 'python-requests' 'python-beautifulsoup4' 'python-lxml')
depends=('fortune-mod')
groups=('fortune-mods')
arch=('any')
source=("${pkgname}::git+https://git.sr.ht/~riderius/ibashparser")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python main.py -ft fortunes -o ibash
    sed 's/[[:blank:]]*$//' -i ibash
    strfile ibash
}

package() {
    install -Dm644 "${srcdir}/${pkgname}/ibash" "${pkgdir}/usr/share/fortune/ibash"
    install -Dm644 "${srcdir}/${pkgname}/ibash.dat" "${pkgdir}/usr/share/fortune/ibash.dat"
}
