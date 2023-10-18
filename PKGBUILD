# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=carburetor
pkgver=4.1.4
pkgrel=1
pkgdesc='Graphical settings app for tractor in GTK'
arch=(any)
url='https://framagit.org/tractor/carburetor'
license=(GPL3)

depends=(
  python
  python-gobject
  gtk4
  libadwaita
  tractor
)
makedepends=(
  python-build
  python-installer
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/carburetor/-/archive/$pkgver/carburetor-$pkgver.tar.gz")
sha256sums=('2f8e4a6446d589f7b24b85c07612f364f82e15f17439303202c58b7ef45f75a9')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Install python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install man page
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" src/carburetor/desktop/carburetor.1

  # Install desktop integration files
  install -Dm0644 -t "$pkgdir/usr/share/applications" \
    src/carburetor/desktop/io.frama.tractor.carburetor.desktop
  install -Dm0644 -t "$pkgdir/usr/share/metainfo" \
    src/carburetor/desktop/io.frama.tractor.carburetor.metainfo.xml
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
    src/carburetor/desktop/io.frama.tractor.carburetor.svg
}
