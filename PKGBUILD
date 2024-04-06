# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=sortty
pkgver=1.8
pkgrel=1
pkgdesc="Sorting algorithms in the terminal"
arch=('any')
url="https://github.com/dormant-chicken/sortty"
license=('GPL-2.0-or-later')
depends=('figlet' 'ncurses' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dormant-chicken/sortty/archive/refs/tags/v${pkgver}.tar.gz"
	"0001-arch-paths.patch"
	"run_sortty.sh")
b2sums=('e71264179b506fb674acd8e46cfc483cbb5106890e8c39741a8a1249762d2bb66541149d81bef77e2ab1f29dc3332c247ad02e69bc241676b84ff21681e49498'
        '2876b49092dd2d08ef3b3054a24b43b4f78d97e32a24a114b0368e78c9dce76a01e6ba0f9be8cf76ff51f475d786960a07efded044e32c90be6a75127927138c'
        'b0b442268d0cfafee4241adac44493dadf9e9b5d37c5a029dde98aa5fbe5a4e1078efcde61a6945f8f97d6365f2418758f97b0de9cb7076da33ce2962af6aa41')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch  --forward --strip=1 --input=../../0001-arch-paths.patch
}

package() {
    install -D -m755 run_sortty.sh "${pkgdir}/usr/bin/sortty"

    cd "${srcdir}/${pkgname}-${pkgver}/src"

    install -D -m644 main.py  "${pkgdir}/usr/share/${pkgname}/main.py"
    install -D -m644 sortty.py "${pkgdir}/usr/share/${pkgname}/sortty.py"
}
