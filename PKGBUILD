# Maintainer: OldJobobo <aur at oldjobobo dot com>
pkgname=thpm
pkgver=1.0.0rc22
pkgrel=1
pkgdesc='Omarchy 4-native manager for external theme integrations'
arch=('any')
url='https://github.com/oldjobobo/thpm'
license=('MIT')
depends=('bash' 'python>=3.11' 'python-rich>=14' 'python-rich<16' 'python-textual>=8.2.8' 'python-textual<9')
optdepends=('omarchy: Omarchy 4 host integration (required for installation and theme operations)')
provides=('theme-hook-plugin-manager')
conflicts=('theme-hook-plugin-manager')
replaces=('theme-hook-plugin-manager')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
install=thpm.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c5969a0f681a0514087f928c1b0038d992a024f911bd08223af304f58b9e9a4b')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/thpm/templates" assets/templates/*
    install -Dm644 -t "$pkgdir/usr/share/thpm/qml" assets/qml/*
    install -Dm755 -t "$pkgdir/usr/share/thpm/hooks" assets/hooks/90-thpm assets/hooks/90-thpm-ui
    install -Dm644 assets/compat/theme-env.sh "$pkgdir/usr/share/thpm/compat/theme-env.sh"
    install -Dm644 -t "$pkgdir/usr/share/thpm/vencord" assets/vencord/*
    install -Dm644 -t "$pkgdir/usr/share/thpm/spicetify" assets/spicetify/*
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 assets/vencord/LICENSE.midnight "$pkgdir/usr/share/licenses/$pkgname/LICENSE.midnight"
}
