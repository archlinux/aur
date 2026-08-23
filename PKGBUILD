# Maintainer: kirarahoshii
pkgname=hyprfm
pkgver=0.1.0
pkgrel=1
pkgdesc="a fast, customizable file manager for hyprland - dolphin functionality, nautilus looks"
arch=('any')
url="https://github.com/iamanuclearwarhead/hyprfm"
license=('MIT')
depends=('gtk4' 'libadwaita' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('vte4: embedded terminal panel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fec8ecb7ce315c33145d40c5072f419c1a88763ee09dea6abe4f73d1850412c7')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 hyprfm/data/hyprfm.desktop "$pkgdir/usr/share/applications/hyprfm.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
