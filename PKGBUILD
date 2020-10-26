# Maintainer: Christian Heses <mail@eworm.de>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=ssss
_tag='84b540782a22d7c6bcf240b34d838e0af846c62d' # git rev-parse releases/v${pkgver}
pkgver=0.5.6
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

  install -D -m0755 -t ${pkgdir}/usr/bin/ ssss-combine ssss-split
  install -D -m0644 -t ${pkgdir}/usr/share/man/man1/ ssss.1 ssss-combine.1 ssss-split.1
  install -D -m0755 -t ${pkgdir}/usr/share/doc/${pkgname}/ doc.html ssss.1.html
}
