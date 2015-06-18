# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=xortool
pkgver=0.96
pkgrel=2
pkgdesc="A tool to analyze multi-byte XOR cipher"
url="https://github.com/hellman/xortool"
depends=('python2')
arch=('any')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/hellman/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('ff8745a337fc376aa3aab0737626fd542c6b2d0abbb098c548ae7d318693bc45f2ed0e5b5635b15841a3cc42127d759514b31a1989404b3980eb0c67993d220e')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's|env python$|env python2|g' -i xortool/*
}

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install -O1 --prefix="${pkgdir}/usr"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
