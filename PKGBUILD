# Maintainer: Daniel Seichter <daniel.seichter@dseichter.de>
pkgname=yahac
pkgver=2026.03.16.beta21
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
sha256sums=('0602ff871eac8e4b0e982f3b863841e4a94f07803797cd395d1f45c21bff8569')

build() {
    cd "$pkgname-${pkgver//./-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-${pkgver//./-}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "icons/io.github.dseichter.yahac.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dseichter.yahac.png"
}
