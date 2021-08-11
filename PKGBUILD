# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Musikid <musikid@outlook.com>

pkgname=fancy
pkgver=0.4.0
pkgrel=1
pkgdesc='Set of software which allows you to control your laptop fans.
It includes a service daemon to allow accessing to the embedded controller
and controlling it through D-Bus, and a CLI to send commands.'
makedepends=('rust' 'pandoc')
depends=('dbus')
optdepends=('systemd: to use the included service file')
license=('MPL2')
arch=('i686' 'x86_64')
url="https://github.com/MusiKid/$pkgname"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('98ce1356eecf95fa2d32120e7ea22debd7fce30ed7c9f13ec0210aa29f5e0d103fb9af4c0154e9529da1fec67b7618e1b998cd672087f2f9d10ef5187a5d5d63')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --all --all-features
}

package() {
  cd "$pkgname-$pkgver"
  make install -- prefix=/usr DESTDIR="${pkgdir}"
}
