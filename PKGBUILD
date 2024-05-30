# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=2.3.5
pkgrel=1
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
sha256sums=('e92949d763a82be21133354d8b4d3307939d6823de91584dc54f7b96a9e783f5')

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
