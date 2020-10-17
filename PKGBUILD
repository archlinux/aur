# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgname=truckersmp-cli
pkgver=0.2.0
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/lhark/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9eb7c1816202c940497fca3bdaebaa56255609a87400c6b2afaaa5ff1af6116becd55285b555fb695d25abfbf51a23c8d145689385cdbf5603c56d13ad3ac806')

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
