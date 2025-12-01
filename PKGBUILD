# Maintainer: Woter im.woterr@gmail.com

pkgname=dotpush
pkgver=1.1.1
pkgrel=1
pkgdesc="A tool to back up dotfiles and push to GitHub."
arch=('any')
url="https://github.com/woterr/dotpush"
license=('MIT')
depends=('python' 'python-keyring' 'python-requests' 'python-installer')
makedepends=('python-build' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woterr/dotpush/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b362128f86969d8f39175fba94d0794d7a7b1b3ba45ca50be01dfd506179d05e')
install='dotpush.install'

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "systemd/dotpush.service" "$pkgdir/usr/lib/systemd/user/dotpush.service"
    install -Dm644 "systemd/dotpush.timer" "$pkgdir/usr/lib/systemd/user/dotpush.timer"
}
