# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=dict-ozhegov
pkgver=1.0
pkgrel=4
pkgdesc="Ozhegov's Russian Dictionary"
arch=('any')
url="https://github.com/Layerex/ozhegov-dict"
license=('unknown')
optdepends=('dictd: dict client and server')
makedepends=('python3' 'dictd' 'git')
provides=('dictd-ozhegov')
conflicts=('dictd-ozhegov')
# Install file from dict-gcide (https://aur.archlinux.org/cgit/aur.git/tree/dict-gcide.install?h=dict-gcide)
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/Layerex/ozhegov-dict.git#commit=4a5876473a935da5e33852bc3360fccc798255e0")
sha256sums=('e94bf5f1775d9d4d9d871eec530ae22cd368e3e2084a282fee27fbbc6ed02efa')

prepare() {
    cd "${srcdir}/${pkgname}"
    python ozhegov-parse.py ozhegov.txt | dictfmt --utf8 --allchars -s "Словарь Ожегова" -u "https://github.com/Layerex/ozhegov-dict" -j ozhegov
    dictzip ozhegov.dict
}

package() {
    cd "${srcdir}/${pkgname}"
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" ozhegov.{dict.dz,index}
}
