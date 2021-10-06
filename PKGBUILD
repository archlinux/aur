# Maintainer: Geert Hendrickx <geert@hendrickx.be>
# Contributor: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

pkgname=spamprobe
pkgver=1.4d
pkgrel=10
pkgdesc="Fast, intelligent, automatic spam detector using Paul Graham style Bayesian analysis of word counts in spam and non-spam emails"
arch=(i686 x86_64)
url="http://spamprobe.sourceforge.net/"
license=('custom:QPL')
depends=(db giflib libpng)
source=(http://downloads.sourceforge.net/spamprobe/$pkgname-$pkgver.tar.gz
	spamprobe-db5.patch spamprobe-gcc43.patch spamprobe-png.patch
	spamprobe-template.patch spamprobe-giflib.patch
	spamprobe-lrucache.patch)
sha256sums=('217ce47dcc6f58d8201fbb0a5e2dc38b5b06349fadb1378fb3647ad8a3f44d68'
            '74c047a55a6e9a553bee29b5f46725b43821fa29630e2ca2ab348ea0852d070d'
            '2f1a60295b2832a8c174efb2efa3d54a9268235795560b35a63f2b31bfd59019'
            '3e99cf08dab2a461e1afada44d809dee2407ec990b3e76175fc026cda2830ded'
            '220523fb2e7e5c94d1f01cf54052e7bf3124bf342779953abe1355789129e621'
            'af1a610bee4f4d4ad68267b88278d837ecde271e371342497f1b048e528d7d36'
            '9814777be778cec4987efc17963296a1429bdd15c7a392e54111af137d8ebc72')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i $srcdir/spamprobe-gcc43.patch
  patch -p0 -i $srcdir/spamprobe-png.patch
  patch -p0 -i $srcdir/spamprobe-db5.patch
  patch -p0 -i $srcdir/spamprobe-template.patch
  patch -p0 -i $srcdir/spamprobe-giflib.patch
  patch -p0 -i $srcdir/spamprobe-lrucache.patch
  ./configure --prefix=/usr --mandir=/usr/share/man --without-jpeg
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
