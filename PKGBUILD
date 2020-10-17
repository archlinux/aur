# Maintainer: Jan Wolff <contact@jancc.de>
pkgname=solarwolfx
pkgver=1.6
pkgrel=1
pkgdesc='Action/Arcade space game'
arch=('x86_64')
url='https://gitlab.com/klockenschooster/solarwolfx'
license=('LGPL')
depends=(
    'python3'
    'python-pygame'
)
makedepends=('python-setuptools')
source=(
    "$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/solarwolfx-v$pkgver.tar.gz"
)
sha256sums=(
    '183abef709991a6c5515539dd5dc5115c88e0fd310a97c7ecc64b1416431cfff'
)

build() {
    cd solarwolfx-v$pkgver
    python setup.py build
}

package() {
    cd solarwolfx-v$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "res/${pkgname}.desktop"
    install -Dm644 "res/solarwolf.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
}

