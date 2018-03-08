# Maintainer: Takuro Onoue <kusanaginoturugi at gmail.com>
pkgname=bitzeny
pkgver=2.0.1
pkgrel=1
pkgdesc="Wallet of cryptocurrency"
arch=('x86_64')
url="https://github.com/BitzenyCoreDevelopers/bitzeny"
license=('MIT')
source=("https://github.com/BitzenyCoreDevelopers/${pkgname}/releases/download/z${pkgver}/${pkgname}-${pkgver}-${arch}-linux-gnu.tar.gz" "https://github.com/BitzenyCoreDevelopers/${pkgname}/archive/z${pkgver}.tar.gz")

md5sums=('73cca9b859b65cfae9d99cbd56fc95a3'
         '13007dd9457e062ca3410ca41d63c273')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/include/"
  mkdir -p "${pkgdir}/usr/lib/"
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/*     ${pkgdir}/usr/bin/
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/include/* ${pkgdir}/usr/include/
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/lib/libbitcoinconsensus.so.0.0.0 ${pkgdir}/usr/lib/
  cd ${pkgdir}/usr/lib/
  ln -s libbitcoinconsensus.so.0.0.0 libbitcoinconsensus.so.0
  ln -s libbitcoinconsensus.so.0.0.0 libbitcoinconsensus.so

  cd "${srcdir}"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -n '/License/,/ Bernard./p' ${pkgname}-z${pkgver}/doc/README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
