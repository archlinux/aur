# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=kantele
pkgver=0.5.3
pkgrel=1
pkgdesc="Settings GUI for the d77 window managers (pwm, wmd77, wasp, spitfire)"
arch=('any')
url="https://github.com/dani-77/kantele"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-tomlkit' 'lua54' 'qt6-wayland')
optdepends=('libnotify: notifications from kantele-shell')
checkdepends=('python-tomlkit' 'lua54')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34fcb5d3866b8223e9041adc9e153bca738fe58fd0be01459ac645788749cd3b')

check() {
    cd "$pkgname-$pkgver"
    python -m unittest discover -s tests
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    python -m compileall -q -d /usr/lib/kantele "$pkgdir/usr/lib/kantele"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
