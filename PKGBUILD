# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-clipman')
pkgver=0.2.2
pkgrel=1
pkgdesc="nwg-shell clipboard manager, a GTK3-based GUI for cliphist"
arch=('any')
url="https://github.com/nwg-piotr/nwg-clipman"
license=('MIT')
provides=('nwg-clipman')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'cliphist' 'xdg-utils')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-clipman/archive/v"$pkgver".tar.gz")

md5sums=('da08903398e9c3c5706c7d5f1f7a7840')

build() {
        cd "${pkgname}-${pkgver}"
        python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-clipman.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-clipman.desktop
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
