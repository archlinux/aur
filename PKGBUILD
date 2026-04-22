# Maintainer: Your Name <your@email.com>
pkgname=meter-tray
pkgver=0.1.0
pkgrel=9
pkgdesc="System tray app for tracking AI usage limits (Codex, OpenCode)"
arch=('any')
url="https://github.com/xddinside/meter"
license=('MIT')
depends=('python' 'python-pystray' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
install=meter-tray.install
source=("git+https://github.com/xddinside/meter.git#commit=bc7329096e05555e125af682c454dd7bf6f6165c")
sha256sums=('SKIP')

build() {
    cd "meter"
    python -m build --wheel --no-isolation
}

package() {
    cd "meter"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install systemd user service
    install -Dm644 systemd/meter.service "$pkgdir/usr/lib/systemd/user/meter.service"
}
