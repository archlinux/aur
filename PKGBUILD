# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris
_pkgname=mpDris
pkgver=1.1.1
pkgrel=2
pkgdesc='A MPD client implementing the dbus MPRIS standard'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('any')
provides=('mpdris')
conflicts=('mpdris-bin' 'mpdris-git')
depends=('glibc' 'gcc-libs')
optdepends=('libsystemd: run mpdris as a service')
makedepends=('cargo')
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"mpdris.service")
sha256sums=('96d177ff4ba94a5f02e54f5abe6615d3519f055535d004de1651c552fd3506ae'
	'29fb19d923984a0d58edf647be99f916d82c37b04e58abb40f793517c8e0a903')
validpgpkeys=('B92EEA8B7EAB2BAAD8FA90E5115AF2F755802897')
_hash='25d1d8b'

build() {
  cd $_pkgname-$pkgver
  GIT_HASH=$_hash cargo build --release --locked
}

package() {
  depends+=('dbus' 'mpd')
  cd $_pkgname-$pkgver

  install -Dm755 "target/release/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "../mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
