# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=owl-lisp
pkgver=0.1.7
pkgrel=1
pkgdesc="Simple purely functional lisp"
url="https://github.com/aoh/owl-lisp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aoh/owl-lisp/archive/v${pkgver}.tar.gz
        hashbang-test-fix-length.patch)
sha512sums=('2c8f0da5da24fce23909b582b729dabcf4d095496db810361838840fb1562188d137bafacc5eb16f779ec159379134f5b8390dfaaa6ee7065b5128bbc957d882'
            'a2961134bd6b8c7f25332cd4305a80e92c3a8de8f815851d81f2b0d67b09aa89e301718ae6dd80ab18e6de4f5059b321505633d61baebb5cf8108945e61d0ad3')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 < "${srcdir}/hashbang-test-fix-length.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
