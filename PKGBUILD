# Maintainer: OldJobobo <aur at oldjobobo dot com>
pkgname=thpm
pkgver=1.0.0rc20
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
sha256sums=('ff7233cdd29e05162c362bad7d8caf09c61b563d4a592d132c39d28ebc0a1cd4')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/thpm/templates" assets/templates/*
    install -Dm644 -t "$pkgdir/usr/share/thpm/qml" assets/qml/*
    install -Dm755 assets/hooks/90-thpm "$pkgdir/usr/share/thpm/hooks/90-thpm"
    install -Dm644 assets/compat/theme-env.sh "$pkgdir/usr/share/thpm/compat/theme-env.sh"
    install -Dm644 -t "$pkgdir/usr/share/thpm/vencord" assets/vencord/*
    install -Dm644 -t "$pkgdir/usr/share/thpm/spicetify" assets/spicetify/*
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 assets/vencord/LICENSE.midnight "$pkgdir/usr/share/licenses/$pkgname/LICENSE.midnight"
}
