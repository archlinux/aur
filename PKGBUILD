# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=nwg-displays
pkgver=0.3.20
pkgrel=1
pkgdesc="Output management utility for sway and Hyprland Wayland compositors"
url="https://github.com/nwg-piotr/nwg-displays"
arch=('any')
license=('MIT')
provides=('nwg-displays')
conflicts=('nwg-displays' 'nwg-displays-git')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'python-i3ipc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v"$pkgver".tar.gz")
md5sums=('9a1714fd61c794f45ac8e049c5f13ed0')

build() {
        cd "${pkgname}-${pkgver}"
        python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -t "$pkgdir"/usr/share/pixmaps nwg-displays.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-displays.desktop
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
