# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgname=truckersmp-cli
pkgver=0.1.0
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/lhark/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('8153f65a1cfb97a2c051ff69f97a6b2614a8f081b7b44d6dcc2d239862f6febce304a6ab65fe7b85c93a47fe946a7c62dd77298425b9068b08220b7469fc03f7')

pkgdesc="A simple launcher for TruckersMP to play ATS or ETS2 in multiplayer."
arch=('x86_64')
url="https://github.com/lhark/truckersmp-cli/"
license=('MIT')
depends=('python' 'sdl2')
optdepends=('python-vdf: automatic steam account detection'
            'python-setuptools: get version information'
            'steam: possibility to use proton'
            'wine: possibility to use wine')
makedepends=('mingw-w64-gcc' 'python-genzshcomp' 'python-setuptools')

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
