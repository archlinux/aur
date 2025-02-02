# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpDris
pkgver=1.1.0
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('any')
provides=('mpdris')
depends=('dbus' 'mpd' 'systemd-libs' 'glibc' 'gcc-libs' 'lib32-glibc')
makedepends=('cargo')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"mpdris.service")
sha256sums=('61801092d2c6d48bebecb8d16f5cac912e069466a4df2524bef5e437f524d220'
	'7abdce25984c597a15639536bf4462a8d475f75802573d59bae637a66ffe5557')
validpgpkeys=('B92EEA8B7EAB2BAAD8FA90E5115AF2F755802897')
_hash='ceb63d1'

build() {
  cd $pkgname-$pkgver
  GIT_HASH=$_hash cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "target/release/mpDris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "../mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
