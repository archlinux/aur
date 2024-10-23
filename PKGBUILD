pkgname=gatk
pkgver=4.6.1.0
pkgrel=1
pkgdesc="Genome Analysis Toolkit https://doi.org/10.1101/gr.107524.110"
arch=('any')
url=https://software.broadinstitute.org/"${pkgname}"
license=('BSD')
makedepends=('git' 'java-environment=17' 'git-lfs')
depends=('java-runtime=17' 'python' 'r')
source=("gatk.sh")
sha256sums=('acc059e37c9e9e9053815095d3eecd00cd115d22f4c14bc4b97d7a5be13234c4')


prepare() {
  cd "${srcdir}"
  git clone https://github.com/broadinstitute/gatk.git "${pkgname}"
  cd $pkgname
  git checkout "${pkgver}"
  git lfs install
}

build() {
  cd "${srcdir}"/"${pkgname}"
  ./gradlew localJar
}

package() {
  install -Dm755 gatk.sh "${pkgdir}"/usr/bin/gatk
  cd "${srcdir}"/"${pkgname}"
  install -Dm644 build/libs/gatk-package-"${pkgver}"-SNAPSHOT-local.jar "${pkgdir}"/usr/share/java/"${pkgname}"/GenomeAnalysisTK.jar
}

