# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=nwg-hello
pkgver=0.2.1
pkgrel=1
pkgdesc="GTK3-based greeter for greetd written in python"
url="https://github.com/nwg-piotr/nwg-hello"
arch=('any')
license=('MIT')
depends=('greetd' 'python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'gnome-themes-extra')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('sway: this or hyprland must be installed'
            'hyprland: this or sway must be installed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-hello/archive/v"$pkgver".tar.gz")
md5sums=('1588544f8b2bb12367df77bcf5282c3a')

build() {
        cd "${pkgname}-${pkgver}"
        python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ nwg-hello-default.json
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ nwg-hello-default.css
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ hyprland.conf
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ sway-config
  install -D -m 644 -t "$pkgdir"/etc/nwg-hello/ README
  install -D -m 644 -t "$pkgdir"/usr/share/nwg-hello/ nwg.jpg
  install -D -m 644 -t "$pkgdir"/usr/share/nwg-hello/ img/*

  install -d -m 755 "$pkgdir"/var/cache/nwg-hello -o greeter
  install -Dm666 -t "$pkgdir"/var/cache/nwg-hello cache.json -o greeter
  
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}