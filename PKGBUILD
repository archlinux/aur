# Maintainer: L4FeeR <muhamedlafeer837 at gmail dot com>
pkgname=k582-control
pkgver=0.1.0
pkgrel=1
pkgdesc="RGB lighting, per-key colours, remaps and macros for the Redragon K582 keyboard"
arch=('any')
url="https://github.com/L4FeeR/k582-control"
license=('GPL-2.0-or-later')
depends=('python' 'pyside6' 'python-evdev')
optdepends=('libnotify: error popups when launched from the app menu')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('025927049aa5ecbd19c7456d8b2b5756889e474b469125446af5991392ded6f9')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
  cp -r k582ctl "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 k582ctl.sh "$pkgdir/usr/lib/$pkgname/k582ctl.sh"
  ln -s "/usr/lib/$pkgname/k582ctl.sh" "$pkgdir/usr/bin/k582ctl"
  python -m compileall -q -d "/usr/lib/$pkgname" "$pkgdir/usr/lib/$pkgname/k582ctl"
  install -Dm644 packaging/60-k582.rules "$pkgdir/usr/lib/udev/rules.d/60-k582.rules"
  sed 's|@LAUNCHER@|/usr/bin/k582ctl|' packaging/k582-control.desktop |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/k582-control.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
