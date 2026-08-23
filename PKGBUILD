# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=truckersmp-cli
pkgver=0.11.0
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/truckersmp-cli/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('af672214e8cc0cac0e23559d19717258f539cc0e8dc10a2ed07b850a107c03f019f08c87509bc92f1246d05b03abf7ed5f977a934ee8bf22a3843ecae04b1555')

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
