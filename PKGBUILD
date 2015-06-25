# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Yann Lopez <arch at lonewulf dot net>
pkgname=babeld
pkgver=1.6.1
pkgrel=1
pkgdesc="A loop-avoiding distance-vector routing protocol"
arch=('i686' 'x86_64')
url="http://www.pps.univ-paris-diderot.fr/~jch/software/babel/"
license=('MIT')
depends=('glibc')
optdepends=('ahcpd: for autoconfiguration of addresses and other informations')
backup=('etc/babeld.conf')
source=("http://www.pps.univ-paris-diderot.fr/~jch/software/files/$pkgname-$pkgver.tar.gz"
  "http://www.pps.univ-paris-diderot.fr/~jch/software/files/$pkgname-$pkgver.tar.gz.asc"
  "babeld.conf"
  "babeld.service")
md5sums=('74290f6c3678f314c79bdc0ab99d9f22'
         'SKIP'
         '2b009a8f97eb038fbd7e73c5dd341bf5'
         'd6407e493f79aad1887394639ef5d50e')
sha1sums=('771ea3341eb47971deb628a9345d0452b49d6245'
          'SKIP'
          '119c7fa6ec86d63b0bd59f395ac6651842ba94bb'
          '864840cfafeeb3f29c0f91421bc210a8c1f4b245')
sha256sums=('54c72b903e9107955a1e274c37db8fe5c9555e7c61bd4b2572ba5358457085b4'
            'SKIP'
            '6bb17ade33e6fa34a5f0a181b1f2135c396108d40ce1278d9b3ebd68580bbf44'
            'fde7554e0d8a200d99b0766bd0ce23cbd7d14593c43d96de158e2fa2c379c1c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr" TARGET="$pkgdir" install

  install -Dm644 ../babeld.conf "${pkgdir}"/etc/babeld.conf
  install -Dm644 ../babeld.service "${pkgdir}"/usr/lib/systemd/system/babeld.service
}
