# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=sophia
pkgver=2.2
pkgrel=1
pkgdesc="Modern embeddable transactional key-value storage"
arch=('any')
url="https://github.com/pmwkaa/sophia"
license=('BSD2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pmwkaa/sophia/archive/version_${pkgver}.tar.gz")
sha256sums=('a1d4f08e5407b47a44b7f12a3e21ca24b7d93c26c100265cb9e0556e7491252d')
options=('staticlibs')
conflicts=('sophia-git')

build() {
  cd "${srcdir}/${pkgname}-version_${pkgver}"
  make
}

check() {
  return 0 # Remove this line to perform the tests (~2min)

  cd "${srcdir}/${pkgname}-version_${pkgver}/test"
  make
  ./sophia-test
}

package() {
  cd "${srcdir}/${pkgname}-version_${pkgver}"

  install -Dm644 sophia.h "$pkgdir/usr/include/sophia/sophia.h"
  install -Dm644 libsophia.a "$pkgdir/usr/lib/libsophia.a"

  for so in libsophia.so*
  do
    install -Dm644 "$so" "$pkgdir/usr/lib/$so"
  done

  # LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
