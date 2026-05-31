pkgname=bearhub
pkgver=0.10.7
pkgrel=7
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}-bearhub.5.tar.gz")
sha256sums=('42001198cccd5ade206f93fc0570c9d3dbb7e49a1f85b790fa577c3af41aee70')

build() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.5"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.5"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "bearhub/desktop/bearhub.desktop" \
    "$pkgdir/usr/share/applications/bearhub.desktop"
  install -Dm644 "bearhub/desktop/bearhub_tray.desktop" \
    "$pkgdir/usr/share/applications/bearhub-tray.desktop"
  install -Dm644 "bearhub/view/resources/img/logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bearhub.svg"
}
