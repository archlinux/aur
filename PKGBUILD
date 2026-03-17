# Maintainer: Daniel Seichter <daniel.seichter@dseichter.de>
pkgname=yahac
pkgver=2026.03.16.beta10
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
sha256sums=('3bf58e58ebbd8e8b9db685f6bc598ba4c9299742e6460cac7c1010084644a367')

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