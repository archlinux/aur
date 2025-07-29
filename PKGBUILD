# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=performa
pkgver=1.1.4
pkgrel=1
pkgdesc="A multi-server monitoring system"
arch=('any')
url="https://github.com/jhuckaby/performa"
license=('MIT')
depends=('bash' 'zsh' 'nodejs' 'python')
makedepends=('npm')
install="$pkgname.install"
source=("https://github.com/jhuckaby/performa/archive/refs/tags/v$pkgver.tar.gz"
        "performa.service")
sha256sums=('4028bf67371e69fe49adb4169c10443942e07d28a40e74234c14f24037fadca0'
            '6d17185565ce6015abf2fb976cf1bfc407ab605f48c3c5280e44cf05159a3f23')
backup=('opt/performa/conf/config.json'
        'usr/lib/systemd/system/performa.service')

provides=('performa')

prepare() {
    cd "$srcdir/performa-$pkgver"
}

build() {
    cd "$srcdir/performa-$pkgver"
    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/performa-$pkgver"
    install -d "$pkgdir/opt/performa"
    cp -a ./* "$pkgdir/opt/performa/"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md

    rm -rf "$pkgdir/opt/performa/.git"
    install -Dm644 "$srcdir/performa.service" "$pkgdir/usr/lib/systemd/system/performa.service"
}
