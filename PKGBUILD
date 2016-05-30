# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=sophia
pkgver=2.1
pkgrel=1
pkgdesc="Modern embeddable transactional key-value storage"
arch=('any')
url="https://github.com/pmwkaa/sophia"
license=('BSD2')
source=("https://github.com/pmwkaa/sophia/archive/version_${pkgver}.tar.gz")
md5sums=('b09f69b022c1e95caf7b1775de051df3')
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
