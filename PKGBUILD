# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=3.1.1
pkgrel=0
pkgdesc="Enhance your Desktop with menus, easy monitor layout and other extensions (powerful hyprland scratchpads)"
arch=(any)
url="https://github.com/hyprland-community/pyprland"
license=('MIT')
groups=()
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pillow')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'gcc')
optdepends=('python-questionary: for pypr-quickstart to work')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
noextract=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b2696395a671d7a26edebd4c70bf7582493c35b9d014e37aeee5faed485511cd')

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
