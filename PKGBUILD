# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=truckersmp-cli
pkgver=0.8.3
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/lhark/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('5f1f0637c733ceb5b4ef9034efcc119cd079055421f1d4ae70e92690076470de98d597da4db3860399e4e4f8eb27b42612fbe8da2f585e18cffd2e837365c3e8')

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
