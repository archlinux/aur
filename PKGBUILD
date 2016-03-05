# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Yann Lopez <arch at lonewulf dot net>
pkgname=babeld
pkgver=1.7.1
pkgrel=2
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
md5sums=('2f71794d4e67f8a5352164ce33611549'
         'SKIP'
         '2b009a8f97eb038fbd7e73c5dd341bf5'
         'b168504f6a23b16711f09959822961db')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr" TARGET="$pkgdir" install

  install -Dm644 ../babeld.conf "${pkgdir}"/etc/babeld.conf
  install -Dm644 ../babeld.service "${pkgdir}"/usr/lib/systemd/system/babeld.service
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
