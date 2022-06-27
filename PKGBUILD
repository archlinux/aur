# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=1.0.3
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and some steam related websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python>=3.7' 'python-certifi' 'python-aiohttp' 'python-gobject' 'stlib>=0.12.1' 'stlib-plugins-git')
makedepends=('python-setuptools' 'imagemagick')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('663c0a0a013856b21a1f45d7141280591d0990c9573ac6d1afbd497ea42364a5')

build() {
    cd $pkgname-$pkgver
    python setup.py build 
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --skip-build --optimize=1 --root=$pkgdir
    sed -i "s|^Icon=.*|Icon=stng|g" steam-tools-ng.desktop
    install -Dm644 steam-tools-ng.desktop $pkgdir/usr/share/applications/steam-tools-ng.desktop
    cd build/lib/steam_tools_ng/icons/
    convert -resize 512x512 stng.png stng.png
    install -Dm644 stng.png  -t $pkgdir/usr/share/icons/hicolor/512x512/apps
}


