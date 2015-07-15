# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=commacd
pkgname=${_pkgname}-git
pkgver=20150714.r35.ac98e66
pkgrel=1
pkgdesc="A faster way to move around Bash"
url="https://github.com/shyiko/commacd"
license=('MIT')
arch=('any')
depends=('bash')
makedepends=('git')
source=('git+https://github.com/shyiko/commacd.git' 'LICENSE' "${_pkgname}.1")
sha512sums=('SKIP'
            '21de58a9ffd486ad1b4616b6c0674d04f05c4f2173ed4050da134a721b8fc23022a2254494d4e9e892691f5e6e1f3bfbdf8fed57ed9a4f2e19349041a2e53974'
            'c2032ecb1ef92e413aab97d6adb787ceac1d112585347ef5c6e0b3cfcd09685337d34229e01c230d5781abddb2f213e5f0082d0d91aa7ea12f83f6f2b1d3a5d8')
install=${pkgname}.install

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${_pkgname}.1 "$pkgdir"/usr/share/man/man1/${_pkgname}.1
    install -Dm755 ${_pkgname}/${_pkgname}.bash "$pkgdir"/usr/share/${_pkgname}/${_pkgname}.bash
}
