# Maintainer: Lara <dev@lara.monster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=3.3.1
pkgrel=1
pkgdesc="Some useful tools for use with steam client or compatible programs, websites"
arch=('any')
url="https://github.com/calendulish/steam-tools-ng"
depends=('python>=3.10' 'python-certifi' 'python-aiohttp' 'python-stlib>=2.1' 'python-stlib-plugins>=1.2.3' 'python-gobject' 'gtk4' 'xdg-utils')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-gettext' 'imagemagick')
license=('GPL')
source=(
    "https://github.com/calendulish/$pkgname/archive/v${pkgver}.tar.gz"
)
sha256sums=('c61e0eedcad58f8cf25dc4830b6cb74ecd505558eb2aabee4fb4ff1324949f9b')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    sed -i "s|^Icon=.*|Icon=steam-tools-ng|g" steam-tools-ng.desktop
    install -Dm644 steam-tools-ng.desktop $pkgdir/usr/share/applications/steam-tools-ng.desktop
    convert -resize 512x512 src/steam_tools_ng/icons/stng.png steam-tools-ng.png
    install -Dm644 steam-tools-ng.png  -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps
}


