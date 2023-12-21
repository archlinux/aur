# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-hello')
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK3-based greeter for greetd written in python"
arch=('any')
url="https://github.com/nwg-piotr/nwg-hello"
license=('MIT')
depends=('greetd' 'python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'gnome-themes-extra')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('sway: this or hyprland must be installed'
            'hyprland: this or sway must be installed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-hello/archive/v"$pkgver".tar.gz")

md5sums=('9023ed2a47fca61993f2e037ac2d5209')

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ nwg-hello-default.json
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ nwg-hello-default.css
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ hyprland.conf
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ sway-config
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ README
  install -D -m 644 -t "$pkgdir"/usr/share/nwg-hello/ nwg.jpg
  install -D -m 644 -t "$pkgdir"/usr/share/nwg-hello/ img/*

  install -d "$pkgdir"/var/cache/nwg-hello
  install -Dm644 -t "$pkgdir"/var/cache/nwg-hello cache.json -o greeter
  
  python setup.py install --root="${pkgdir}" --optimize=1
}