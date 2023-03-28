# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
_pkgname=nwg-panel
pkgname=$_pkgname-git
pkgver=r1041.ef79fb8
pkgrel=1
pkgdesc="GTK3-based panel for sway Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-panel"
license=('MIT')
provides=('nwg-panel')
conflicts=('nwg-panel' 'nwg-panel-git')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-dasbus' 'python-netifaces' 'python-psutil' 'python-requests' 'bluez-utils' 'gtk3' 'gtk-layer-shell' 'light' 'pamixer' 'playerctl' 'nwg-icon-picker')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('wlr-randr: for non-sway Wayland WMs support'
            'swaync: for Sway Notification Center support'
            'ddcutil: for external displays brightness control')
conflicts=('nwg-panel')
source=('nwg-panel::git+https://github.com/nwg-piotr/nwg-panel#branch=master')

md5sums=('SKIP')

pkgver() {
   cd "$srcdir/$_pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-panel.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-processes.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-panel-config.desktop
  install -D -t "$pkgdir"/usr/share/applications nwg-processes.desktop
}
