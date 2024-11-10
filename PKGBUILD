# Maintainer: tomsh <tomsh@disroot.org>
pkgname=yamep
pkgver=1.0.1
pkgrel=1
pkgdesc="YAMEP - Yet Another Markdown Editor in Python"
arch=('any')
url="https://codeberg.org/tomsh/yamep"
license=('MIT')
depends=('python' 'pyside6' 'python-markdown' 'python-platformdirs' 'python-pymdown-extensions')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tomsh/yamep/archive/${pkgver}.tar.gz"
        "yamep.desktop")
sha256sums=('0422f08b2a1aa49c2fee9c4119f99ae7f88a9e722c63157c3f049022c0b442ab'
            'c2d21877504fbb883c44772b430234c64f02cdcf771a9e52f44a83e6786c39a1')

build() {
    cd "$srcdir/${pkgname}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Install desktop file
    install -Dm644 "$srcdir/yamep.desktop" "$pkgdir/usr/share/applications/yamep.desktop"

    # Install icon
    install -Dm644 "$srcdir/yamep/yamep/resources/yamep.png" "$pkgdir/usr/share/pixmaps/yamep.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
