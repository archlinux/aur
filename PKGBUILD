# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=truckersmp-cli
pkgver=0.10.1
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/truckersmp-cli/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('26b42319f67f29bd6147a52e0d1cef0c96887b9d3d1eacacef7e95df3471a6ecabefb2cc57ba058e255c731ce20a463c5d8698f35e714b1b43bb14582e8455e9')

pkgdesc="A simple launcher for TruckersMP to play ATS or ETS2 in multiplayer."
arch=('x86_64')
url="https://github.com/truckersmp-cli/truckersmp-cli"
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
