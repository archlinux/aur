# Maintainer: OldJobobo <aur at oldjobobo dot com>
pkgname=thpm
pkgver=1.0.0rc2
pkgrel=1
pkgdesc='Omarchy 4-native manager for external theme integrations'
arch=('any')
url='https://github.com/oldjobobo/thpm'
license=('MIT')
depends=('python>=3.11' 'python-textual>=8.2.8')
optdepends=('omarchy: Omarchy 4 host integration (required for installation and theme operations)')
provides=('theme-hook-plugin-manager')
conflicts=('theme-hook-plugin-manager')
replaces=('theme-hook-plugin-manager')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('eb23b46e5e36fef17a26bcdf3b4d27a207a50d9d7ae5a4cd83201e97f3374673')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/thpm/templates" assets/templates/*
    install -Dm644 -t "$pkgdir/usr/share/thpm/qml" assets/qml/*
    install -Dm755 assets/hooks/90-thpm "$pkgdir/usr/share/thpm/hooks/90-thpm"
    install -Dm644 assets/compat/theme-env.sh "$pkgdir/usr/share/thpm/compat/theme-env.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
