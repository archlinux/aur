# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lfc-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="The Lingua Franca compiler"
arch=('any')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/lfc_${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('61005337bd16d81b92adebde932f67ce48a697c15e5ffa66f3bb1562d1cf4665024b2b1c475f45ea55c6700b28bc9e7556879f4c1edaa115b6b86588e027dd8b'
            '3b445e4c24bc0514043db597e02924c96917f55519db65f7a044e70c8905cb57387269437fb1648893ce68da6e2894eb3cc0a8c5de8944044c9513ae5fb89c8c')

package() {
  install -Dm644 "${srcdir}/lfc_${pkgver}/lib/jars/org.lflang.lfc-${pkgver}-all.jar" "${pkgdir}/usr/share/java/lfc/org.lflang.lfc-${pkgver}-all.jar"
  install -dm755 "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/lfc"
  echo "java -jar \"/usr/share/java/lfc/org.lflang.lfc-${pkgver}-all.jar\" \"\$@\"" >> "${pkgdir}/usr/bin/lfc"
  chmod 755 "${pkgdir}/usr/bin/lfc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lfc-bin/LICENSE"
}
