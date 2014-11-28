# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=unworkable
pkgver=0.53
pkgrel=2
pkgdesc="A BitTorrent client aiming for efficiency, simplicity and high code quality"
arch=('i686' 'x86_64')
url="http://code.google.com/p/unworkable/"
license=('BSD')
depends=('openssl' 'libevent')
makedepends=('scons' 'bison')
source=(http://unworkable.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha256sums=('80640df2319c128c2bf35f2279fb099985bd8c269808e97b5b0d420f38af6a34')

build() {
  cd $pkgname

  scons
}

package() {
  cd $pkgname

  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
  install -D -m644 $pkgname.1 ${pkgdir}/usr/share/man/man1/$pkgname.1

# License
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  cat ${srcdir}/$pkgname/main.c | tail -n+3 | head -n13 > \
      ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
