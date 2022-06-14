# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=parquet-cli
pkgver=1.12.3
pkgrel=1
pkgdesc='Java based command line tools that aid in the inspection of the Parquet files'
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
arch=('any')
source=(
  "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=parquet/apache-parquet-${pkgver}/apache-parquet-${pkgver}.tar.gz")
sha256sums=('8c66309a4b1c5f57779b199ac757475c3771864087dd81bd499fd3beb0e84aee')

url='https://github.com/apache/parquet-mr'
license=('Apache')

build() {
  cd "apache-parquet-${pkgver}/parquet-cli"
  mvn --batch-mode -Dmaven.repo.local="${srcdir}/.m2" clean package -Plocal
  mvn dependency:copy-dependencies
}

package() {
  install -m 755 -d "${pkgdir}/usr/bin/"
  cp ../parquet-cli "${pkgdir}/usr/bin"
  cd "apache-parquet-${pkgver}/parquet-cli"

  install -m 755 -d "${pkgdir}/usr/share/java/parquet-cli"
  install -m 644 -t "${pkgdir}/usr/share/java/parquet-cli" "target/parquet-cli-${pkgver}.jar"
  cp -a target/dependency/*.jar "${pkgdir}/usr/share/java/parquet-cli"
}
