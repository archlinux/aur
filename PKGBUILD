# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=truckersmp-cli
pkgver=0.9.1.1
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/truckersmp-cli/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('8f98b263ac2999cb8abcc2e43eb4a29b8598a3e50a1483316b6e25a4b4ceb6963c009727cf49341934b1dc40be9025ad7c60241dfe25d07cdf26b0641b0dc02b')

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
