# Maintainer: Lara <dev@lara.monster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=3.0
pkgrel=1
pkgdesc="Some useful tools for use with steam client or compatible programs, websites"
arch=('any')
url="https://github.com/calendulish/steam-tools-ng"
depends=('python>=3.9' 'python-certifi' 'python-aiohttp' 'python-stlib>=1.3' 'python-stlib-plugins>=1.2' 'python-gobject' 'gtk4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'imagemagick')
license=('GPL')
source=("https://github.com/calendulish/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('1b05a03c4c1661cd951b82a46d8070b6556705c851401e0c8908b5267567a09c')

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


