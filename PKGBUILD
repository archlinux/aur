# Maintainer: Selim Bucher <me@selim.one>
pkgname=ni-wine
pkgver=2.0.0
pkgrel=1
pkgdesc="Native Instruments software under Wine — setup, launch, and product management"
arch=('any')
url="https://github.com/selimbucher/native-instruments"
license=('MIT')
depends=('python' 'wine' 'winetricks' 'cabextract' '7zip' 'msitools'
         'procps-ng' 'xorg-server-xvfb' 'xdotool' 'zenity' 'xdg-utils'
         'desktop-file-utils' 'chromium')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('wine-staging: recommended Wine build for Native Instruments'
            'yad: nicer-looking setup progress dialog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4994a689c4bc4b8d2c575e80755556393c7fdee9ec4f8ce5be7ec8f57c2003cd')

build() {
  cd "native-instruments-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "native-instruments-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 src/ni_wine/data/native-access.desktop \
    "$pkgdir/usr/share/applications/native-access.desktop"
  install -Dm644 src/ni_wine/data/native-access.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/native-access.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
