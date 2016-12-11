# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Yann Lopez <arch at lonewulf dot net>
pkgname=babeld
pkgver=1.8.0
pkgrel=1
pkgdesc="A loop-avoiding distance-vector routing protocol"
arch=('i686' 'x86_64')
url="https://www.irif.fr/~jch/software/babel/"
license=('MIT')
depends=('glibc')
optdepends=('ahcpd: for autoconfiguration of addresses and other informations')
backup=('etc/babeld.conf')
source=("https://www.irif.fr/~jch/software/files/$pkgname-$pkgver.tar.gz"
  "https://www.irif.fr/~jch/software/files/$pkgname-$pkgver.tar.gz.asc"
  "babeld.conf"
  "babeld.service")
validpgpkeys=('F8E70AAD74D32CAC27B9AFD62652C881EADB5526')
md5sums=('eb1c66c382e9181c418ebd84e52b5af2'
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
