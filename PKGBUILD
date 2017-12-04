# Contributer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=gatk
_pkgver=4.beta.6
pkgver="${_pkgver//.beta/}"
pkgrel=1
pkgdesc="Genome Analysis Toolkit - Variant Discovery in High-Throughput Sequencing Data"
arch=('any')
url="https://software.broadinstitute.org/gatk/"
license=('BSD3')
depends=('bash' 'java-runtime>=8' 'gradle')
provides=('gatk')
conflicts=('gatk')
source=("https://github.com/broadinstitute/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('caff053f04974044e06cd5fc8e344d7c')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./gradlew localJar
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/build/libs/gatk-package-unspecified-SNAPSHOT-local.jar" "${pkgdir}/usr/share/java/${pkgname}-${_pkgver}/GenomeAnalysisTK.jar"
  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}-${_pkgver}/LICENSE.TXT"
  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}-${_pkgver}/README.md"
  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}-${_pkgver}/AUTHORS"
}

