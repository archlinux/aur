# Maintainer: Daniel Seichter <daniel.seichter@dseichter.de>
pkgname=yahac
pkgver=2026.03.16.beta11
pkgrel=1
pkgdesc="Yet Another Home Assistant Client - Desktop tray application for Home Assistant"
arch=('x86_64')
url="https://github.com/dseichter/yahac"
license=('GPL3')
options=('!debug')
depends=('pyside6' 'python-urllib3' 'python-paho-mqtt')
optdepends=('libnotify: Desktop notifications')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dseichter/yahac/archive/v${pkgver//./-}.tar.gz")
sha256sums=('2584e02d320180637b776fb5af585ca45d0cb0457bdd3bd455dc44af84ab8791')

build() {
    cd "$pkgname-${pkgver//./-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-${pkgver//./-}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm755 src/yahac.py "$pkgdir/usr/bin/yahac"
    install -Dm644 packaging/debian/yahac.desktop "$pkgdir/usr/share/applications/yahac.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}