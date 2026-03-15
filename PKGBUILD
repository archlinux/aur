# Contributor: Daniel Hillenbrand <codeworkx at bbqlinux dot org>
# Maintainer: Aaron Liu <aaronliu gmailchorn>

pkgname=vectorchord-immich-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Latest version compatible with immich-server of VectorChord, the PostgreSQL vector similarity search extension'
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPL-3.0-ONLY OR Elastic-2.0')
depends=('postgresql>=18' 'postgresql<19' 'pgvector')
provides=("vectorchord=$pkgver")
conflicts=("vectorchord")
source=("${url}/releases/download/${pkgver}/postgresql-18-vchord_${pkgver}_${arch}-linux-gnu.zip"
	"LICENSE.md::${url}/raw/refs/tags/${pkgver}/LICENSE"
	"${url}/raw/refs/tags/${pkgver}/licenses/LICENSE.ELv2")
sha256sums=('e345f0da4e31f7a8d858dda8481842f5c4beb5b53d968939c8a6d7e7e330d5a2'
            '19e530f3f1af21643497906f22a52a5c136059983ae379ba5c7055831f32c862'
            '65eefc127ee28db1cc1535df6369e8d751d7cacf1b1363be0e47ae9658c04ffc')

package() {
  install -Dm 755 $srcdir/pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/sharedir/extension/vchord--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/sharedir/extension/vchord.control $pkgdir$(pg_config --sharedir)/extension/vchord.control
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 "$srcdir/LICENSE.ELv2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ELv2"
}
