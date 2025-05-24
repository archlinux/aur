# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=fortune-mod-ibash
pkgver=2022.10
pkgrel=5
pkgdesc="A collection of quotes for fortune-mod from http://ibash.org.ru"
url="http://ibash.org.ru"
license=("unknown")
makedepends=('git' 'python' 'python-requests' 'python-beautifulsoup4' 'python-lxml')
depends=('fortune-mod')
groups=('fortune-mods')
arch=('any')
source=("${pkgname}::git+https://git.sr.ht/~riderius/ibashparser#commit=49e248d0c0acbae7ae8a050d7147155b13d6c372")
sha256sums=('d816cdd8afaa96d5c61c33e4f312f44516adbf10fc612d632371a191c0cc645a')

build() {
    cd "${srcdir}/${pkgname}"
    python main.py -fwt fortunes -to 10 -o ibash
    sed 's/[[:blank:]]*$//' -i ibash
    strfile ibash
}

package() {
    install -Dm644 "${srcdir}/${pkgname}/ibash" "${pkgdir}/usr/share/fortune/ibash"
    install -Dm644 "${srcdir}/${pkgname}/ibash.dat" "${pkgdir}/usr/share/fortune/ibash.dat"
}
