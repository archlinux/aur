# Maintainer: Abdelrahman <abot8639@gmail.com>
pkgname=tcalm
pkgver=1.0.0
pkgrel=1
pkgdesc="Prayer Time Media Pauser for Linux (CLI, TUI, and systemd service)"
arch=('any')
url="https://github.com/abod8639/Tcalm"
license=('MIT')
depends=(
    'python'
    'playerctl'
)
optdepends=(
    'libnotify: for desktop notifications'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname::git+https://github.com/abod8639/Tcalm.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Systemd user service
    install -Dm644 tcalm.service "$pkgdir/usr/lib/systemd/user/tcalm.service"

    # License and documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
