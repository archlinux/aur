# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=kantele
pkgver=0.5.1
pkgrel=1
pkgdesc="Settings GUI for the d77 window managers (pwm, wmd77, wasp, spitfire)"
arch=('any')
url="https://github.com/dani-77/kantele"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-tomlkit' 'lua54' 'qt6-wayland')
optdepends=('libnotify: notifications from kantele-shell')
checkdepends=('python-tomlkit' 'lua54')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0040a8dd1f7b9931c27e9329d9fb49fb4bb3f8096d932efe893203fab86dcd16')

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
