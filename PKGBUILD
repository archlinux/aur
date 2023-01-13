# Maintainer: Lara <dev@lara.monster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=2.1.0
pkgrel=1
pkgdesc="Some useful tools for use with steam client or compatible programs, websites"
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python>=3.9' 'python-certifi' 'python-aiohttp' 'python-stlib>=1.1' 'python-stlib-plugins>=1.1' 'python-gobject' 'gtk4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'imagemagick')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('6348ccdf49d631e6d8a1e1f08809e40cf78f4eae519c1bdfe76d82a04f6a2a47')

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


