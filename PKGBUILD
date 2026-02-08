# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=3.1.0
pkgrel=0
pkgdesc="Enhance your Desktop with menus, easy monitor layout and other extensions (powerful hyprland scratchpads)"
arch=(any)
url="https://github.com/hyprland-community/pyprland"
license=('MIT')
groups=()
depends=('python' 'python-aiofiles' 'python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-poetry' 'gcc')
optdepends=('python-pillow: for wallpapers rounded borders'
    'python-questionary: for pypr-quickstart to work')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
noextract=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('babcb8975b9d380472f1fb4eef5ad40b2d8827cfd15ef8b39164593c08aaa53e')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
    cd client
    ${CC:-gcc} -o pypr-client pypr-client.c
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0755 "client/pypr-client" "$pkgdir/usr/bin/pypr-client"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
