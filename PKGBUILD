# Maintainer: James Callahan <james@wavesquid.com>

pkgname=qubes-u2f
pkgver=1.2.10
pkgrel=1
pkgdesc='Securely forward U2F challenge-response authentication between Web browser and U2F HID token without exposing the browser and USB stack to one another'
url='https://github.com/QubesOS/qubes-app-u2f'
license=()
arch=(any)
depends=(
  'python'
  'python-u2flib-host'
  'python-requests'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QubesOS/qubes-app-u2f/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07b6a32523851e1894739c6d53aa644a9485c027f93893e3f7ca7039caf041f5')

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
