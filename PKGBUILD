# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=smartmeter
pkgver=0.2.6
pkgrel=1
epoch=
pkgdesc="Read energy utility meter with IR dongle"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/smartmeter"
license=('MIT')
groups=()
depends=('mosquitto')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/smartmeter.conf')
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/smartmeter.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 resources/smartmeter.service "$pkgdir"/usr/lib/systemd/system/smartmeter.service
  install -Dm644 resources/smartmeter.conf "$pkgdir"/etc/smartmeter.conf
}
