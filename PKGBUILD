# Maintainer: Selby Mashiki mashikiselby@gmail.com
pkgname=hyprkit-git
pkgver=r8.75f2b27
pkgrel=1
pkgdesc="A companion CLI for managing and improving your Hyprland setup"
arch=('any')
url="https://github.com/Kolgrim33/hyprkit"
license=('MIT')
depends=('python' 'python-rich' 'hyprland')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=('hyprkit')
conflicts=('hyprkit')
source=("$pkgname::git+https://github.com/Kolgrim33/hyprkit.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
