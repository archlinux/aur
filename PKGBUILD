pkgname=linux-iprojection
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Linux control & casting app for Epson projectors"
arch=('any')
url="https://github.com/John-Varghese-EH/Linux-iProjection"
license=('AGPL3')
depends=('python' 'python-gobject' 'python-zeroconf' 'gtk4' 'libadwaita')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file and icon
  install -Dm644 data/dev.linux_iprojection.LinuxIProjection.desktop "$pkgdir/usr/share/applications/dev.linux_iprojection.LinuxIProjection.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/dev.linux_iprojection.LinuxIProjection.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.linux_iprojection.LinuxIProjection.svg"
  install -Dm644 data/dev.linux_iprojection.LinuxIProjection.metainfo.xml "$pkgdir/usr/share/metainfo/dev.linux_iprojection.LinuxIProjection.metainfo.xml"
  install -Dm644 data/linux_iprojection.gresource "$pkgdir/usr/share/linux-iprojection/linux_iprojection.gresource"
}
