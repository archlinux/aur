pkgname=bearhub
pkgver=0.10.7
pkgrel=2
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}-bearhub.2.tar.gz")
sha256sums=('fa0ebcc9b37b51b78df3b5d795766fa9d0c09379954fe7d03737404dca7ab2ff')

build() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.2"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.2"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
