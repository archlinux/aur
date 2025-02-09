# Maintainer: James Callahan <james@wavesquid.com>
# Maintainer: Danny Grove <aur@dannygrove.com>

pkgname=qubes-u2f
pkgver=2.0.6
pkgrel=1
pkgdesc='Securely forward U2F challenge-response authentication between Web browser and U2F HID token without exposing the browser and USB stack to one another'
url='https://github.com/QubesOS/qubes-app-u2f'
license=('GPL2')
arch=(any)
depends=(
  'python'
  'python-fido2'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QubesOS/qubes-app-u2f/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c80920c3dc76c1214356deeb99d456539bd39315a3a5743313b9a2f8930834f9')

build() {
  cd "qubes-app-u2f-$pkgver"
  python setup.py build
}

package() {
  cd "qubes-app-u2f-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" systemd/*.service
  install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" udev/*
  install -D -t "$pkgdir/etc/qubes-rpc/" qubes-rpc/*
  install -Dm644 -t "$pkgdir/etc/qubes/post-install.d/" post-install.d/*
}
