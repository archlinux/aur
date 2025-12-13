# Contributor: Daniel Hillenbrand <codeworkx at bbqlinux dot org>
# Maintainer: Aaron Liu <aaronliu gmailchorn>

pkgname=vectorchord-immich-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='Latest version compatible with immich-server of VectorChord, the PostgreSQL vector similarity search extension'
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPL-3.0-ONLY OR Elastic-2.0')
depends=('postgresql>=18' 'pgvector')
provides=("vectorchord=$pkgver")
source=("${url}/releases/download/${pkgver}/postgresql-18-vchord_${pkgver}_${arch}-linux-gnu.zip"
	"${url}/raw/refs/tags/${pkgver}/LICENSE"
	"${url}/raw/refs/tags/${pkgver}/licenses/LICENSE.ELv2")
sha256sums=('73fb60bf8b0e2c1bb4df700fa5400d3f2819482e0b7dbdc7e2e88212efff1819')

package() {
  install -Dm 755 $srcdir/pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/sharedir/extension/vchord--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/sharedir/extension/vchord.control $pkgdir$(pg_config --sharedir)/extension/vchord.control
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/licenses/LICENSE.ELv2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ELv2"
}
