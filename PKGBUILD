# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Musikid <musikid@outlook.com>

pkgname=fancy
pkgver=0.7.3
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
sha512sums=('67430980bdae994f488eb55f1d3ba2c5517beaacb118e3aa412b58466699b9f8c183b367ed4a51bcb754d60828e4a556b4f1e58d24fffd042faddb66df3c35e4')

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
