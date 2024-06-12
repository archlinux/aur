# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=2.3.8
pkgrel=0
pkgdesc="Customize your Hyprland with scratchpads, menus, easy monitor layout and other extensions"
arch=(any)
url="https://github.com/hyprland-community/pyprland"
license=('MIT')
groups=()
depends=('python' 'python-aiofiles' 'hyprland' 'python-build' 'python-installer')
makedepends=('python-poetry')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
noextract=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('331c7a008ca7dc2ffcce8a2cfd8a808997963516d06ce026829b19483e1be487')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 "scripts/completions/pypr.bash" "$pkgdir/usr/share/bash-completion/completions/pypr"
    install -Dm0644 "scripts/completions/pypr.zsh" "$pkgdir/usr/share/zsh/site-functions/_pypr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
