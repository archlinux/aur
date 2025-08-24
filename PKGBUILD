# Maintainer: Woter im.woterr@gmail.com

pkgname=dotpush
pkgver=1.0.3
pkgrel=1
pkgdesc="A tool to back up dotfiles and push to GitHub."
arch=('any')
url="https://github.com/woterr/dotpush"
license=('MIT')
depends=('python' 'python-keyring' 'python-requests' 'python-installer')
makedepends=('python-build' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woterr/dotpush/releases/download/v$pkgver/dotpush-$pkgver.tar.gz")
sha256sums=('a87a4fe9e2537777d85c040cd7f2bad233437213bbc5f80f8661569e2a709e13')
install='dotpush.install'

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # python -m pip install --root="$pkgdir" --prefix=/usr dist/*.whl
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "systemd/dotpush.service" "$pkgdir/usr/lib/systemd/user/dotpush.service"
    install -Dm644 "systemd/dotpush.timer" "$pkgdir/usr/lib/systemd/user/dotpush.timer"
}
