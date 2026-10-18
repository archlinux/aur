# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=3.4.6
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
sha256sums=('bf75e9ad8e4222988ef5e632555e09ce5d00f0fbb2763e40741c41e791673258')

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
