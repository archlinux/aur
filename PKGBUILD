pkgname=bearhub
pkgver=0.10.7
pkgrel=6
pkgdesc="Arch-first package manager hub (community-maintained fork of bauh)"
arch=('any')
url="https://github.com/spalencsar/bearhub"
license=('ZLIB')
depends=(
  'python'
  'python-pyqt5'
  'python-requests'
  'python-colorama'
  'python-pyyaml'
  'python-dateutil'
)
optdepends=(
  'python-lxml: web application support'
  'python-beautifulsoup4: web application support'
  'flatpak: flatpak support'
  'appimagekit: appimage support'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('bearhub' 'bauh')
conflicts=('bearhub-git' 'bauh' 'bauh-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}-bearhub.4.tar.gz")
sha256sums=('5b39fc47dace16e01ed8115a601af4f05e92db7669eea04b0c409d8c779aa4a7')

build() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.4"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.4"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "bearhub/desktop/bearhub.desktop" \
    "$pkgdir/usr/share/applications/bearhub.desktop"
  install -Dm644 "bearhub/desktop/bearhub_tray.desktop" \
    "$pkgdir/usr/share/applications/bearhub-tray.desktop"
  install -Dm644 "bearhub/view/resources/img/logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bearhub.svg"
}
