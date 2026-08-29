# Maintainer: OldJobobo <aur at oldjobobo dot com>
pkgname=thpm-git
pkgver=1.0.0rc24.r0.g73abb0e
pkgrel=1
pkgdesc='Omarchy 4-native manager for external theme integrations (git)'
arch=('any')
url='https://github.com/oldjobobo/thpm'
license=('MIT')
depends=('bash' 'python>=3.11' 'python-rich>=14' 'python-rich<16' 'python-textual>=8.2.8' 'python-textual<9')
optdepends=('omarchy: Omarchy 4 host integration (required for installation and theme operations)')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('thpm' 'theme-hook-plugin-manager')
conflicts=('thpm' 'theme-hook-plugin-manager')
replaces=('theme-hook-plugin-manager')
install=thpm.install
source=('git+https://github.com/oldjobobo/thpm.git')
sha256sums=('SKIP')

pkgver() {
    cd thpm
    git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd thpm
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd thpm
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
