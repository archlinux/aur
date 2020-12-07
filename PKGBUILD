# Maintainer: Christian Heses <mail@eworm.de>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=ssss
_tag='59091974830377a78b9a5577f2594f64a75f3c1c' # git rev-parse releases/v${pkgver}
pkgver=0.5.7
pkgrel=1
pkgdesc="Simple command-line implementation of Shamir's Secret Sharing Scheme"
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/MrJoy/ssss'
depends=('gmp')
makedepends=('git' 'xmltoman')
validpgpkeys=('6DD601691023247FB4FE63A3498FCFAD9FE6855B') # Jon Frisby <jfrisby@mrjoy.com>
source=("git+https://github.com/MrJoy/ssss#tag=${_tag}?signed")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}/

  make CC="cc ${CFLAGS} ${LDFLAGS}"
}

package() {
  cd ${srcdir}/${pkgname}/

  install -D -m0755 -t ${pkgdir}/usr/bin/ ssss-split
  ln -s ssss-split ${pkgdir}/usr/bin/ssss-combine
  install -D -m0644 -t ${pkgdir}/usr/share/man/man1/ ssss.1 ssss-combine.1 ssss-split.1
  install -D -m0755 -t ${pkgdir}/usr/share/doc/${pkgname}/ doc.html ssss.1.html
}
