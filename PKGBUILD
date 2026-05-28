pkgname=bearhub
pkgver=0.10.7
pkgrel=4
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}-bearhub.3.tar.gz")
sha256sums=('c1811fc409d5126dddb5d1dd5249f38f994e02362af3c15de1d5b0608c103249')

build() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.3"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.3"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "bauh/desktop/bauh.desktop" \
    "$pkgdir/usr/share/applications/bearhub.desktop"
  install -Dm644 "bauh/desktop/bauh_tray.desktop" \
    "$pkgdir/usr/share/applications/bearhub-tray.desktop"
  install -Dm644 "bauh/view/resources/img/logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bearhub.svg"
}
