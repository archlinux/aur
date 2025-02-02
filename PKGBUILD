# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpDris
pkgver=1.0.0
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
sha256sums=('6e1b4bf12f7e8fe045017a12390f1c92fa16d480f84f6acea57335be49bc9dbe'
	'7abdce25984c597a15639536bf4462a8d475f75802573d59bae637a66ffe5557')
validpgpkeys=('B92EEA8B7EAB2BAAD8FA90E5115AF2F755802897')
hash='3963f9a'

build() {
  cd $pkgname-$pkgver
  GIT_HASH=$hash cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "target/release/mpDris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "../mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
