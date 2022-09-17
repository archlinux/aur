pkgname=python-libnxctrl-git
_pkgname="python-libnxctrl"
pkgdesc="Python Library Emulating Nintendo Switch Controllers"
pkgver=0.1.7.e3ed8bc
pkgrel=1
arch=('i686' 'x86_64')
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/Victrid/libnxctrl"
license=('GPL3')
depends=(
	"dbus-python" "python-flask" "python-flask-socketio" "python-eventlet"
	"python-blessed" "python-pynput" "python-psutil" "python-cryptography"
	"python-hid" "python-aioconsole"
)
optdepends=()
makedepends=('git')
source=("$_pkgname::git+https://github.com/Victrid/libnxctrl.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(python setup.py --version)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	git submodule update --init --recursive --depth 1
	python setup.py install --root="$pkgdir/"  --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
