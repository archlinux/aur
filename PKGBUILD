# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=pulsemeter
pkgver=1.4.4
pkgrel=1
epoch=
pkgdesc="Pulse energy meter with Arduino and simple LED sensor" 
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/ahpohl/pulsemeter"
license=('MIT')
groups=()
depends=('rrdtool' 'curl')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/pulsemeter.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir"/usr install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 resources/pulsemeter.conf "$pkgdir"/etc/pulsemeter.conf
  install -Dm644 resources/pulsemeter.service "$pkgdir"/usr/lib/systemd/system/pulsemeter.service
}
