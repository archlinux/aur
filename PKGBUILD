# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="The Lingua Franca compiler and command line tools"
arch=('any')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
replaces=('lfc-bin')
conflicts=('lfc-bin')
source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/lf-cli-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('29acca3e1c82f5a527726aeaab4ae03ff0ea0c5d3ea18a1d643340a1a7ab9e6f2ed31a7173d680ddaf00684d171e1934e7a51f3f2a37fee532f4440d5d2112e4'
            '3b445e4c24bc0514043db597e02924c96917f55519db65f7a044e70c8905cb57387269437fb1648893ce68da6e2894eb3cc0a8c5de8944044c9513ae5fb89c8c')

package() {
  install -Dm644 "${srcdir}/lf-cli-${pkgver}/lib/jars/org.lflang-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/org.lflang-${pkgver}.jar"
  install -dm755 "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/lfc"
  echo "java -cp \"/usr/share/java/${pkgname}/org.lflang-${pkgver}.jar\" \"org.lflang.cli.Lfc\" \"\$@\"" >> "${pkgdir}/usr/bin/lfc"
  chmod 755 "${pkgdir}/usr/bin/lfc"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/lff"
  echo "java -cp \"/usr/share/java/${pkgname}/org.lflang-${pkgver}.jar\" \"org.lflang.cli.Lff\" \"\$@\"" >> "${pkgdir}/usr/bin/lff"
  chmod 755 "${pkgdir}/usr/bin/lff"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lfc-cli-bin/LICENSE"
}
