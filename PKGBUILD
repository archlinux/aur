# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgname=truckersmp-cli
pkgver=0.6.0
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/lhark/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('582150df33526d5cf53907f5873140086d14409344cc659758ac5124f7dbe0a58b6e95f1b9e9722106abd8992df257ce5c1a806f5aecc734a69119e78e47e643')

pkgdesc="A simple launcher for TruckersMP to play ATS or ETS2 in multiplayer."
arch=('x86_64')
url="https://github.com/lhark/truckersmp-cli/"
license=('MIT')
depends=('python' 'sdl2')
optdepends=('python-vdf: automatic steam account detection'
            'python-setuptools: get version information'
            'steam: possibility to use proton'
            'wine: possibility to use wine')
makedepends=('mingw-w64-gcc' 'python-setuptools')

build() {
    cd "$pkgname-$pkgver" || exit
    make
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver" || exit
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
