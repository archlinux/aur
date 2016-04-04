# Maintainer: Miguel Useche <migueluseche@skatox.com>

pkgname=bfg-repo-cleaner
pkgver=1.12.12
pkgrel=1
pkgdesc="Removes larges or troublesome blobs like git-filter-branch does, but faster"
arch=('any')
url="https://rtyley.github.io/bfg-repo-cleaner/"
license=('GPL')
depends=('java-runtime' 'git')
source=("https://repo1.maven.org/maven2/com/madgag/bfg/${pkgver}/bfg-${pkgver}.jar")
noextract=("bfg-${pkgver}.jar")
sha512sums=('f3a9d39c764a8d42054ed346a51ac2402814a4a18f2802640e776653a3081800e38e3052ac447fd82f0d1667aa1ca5d6745a2e7b9c7503d3fec7c25d364c8cf3')
install=bfg-repo-cleaner.install

package() {
  install -Dm644 "${srcdir}/bfg-${pkgver}.jar" "${pkgdir}/usr/share/java/bfg/bfg-${pkgver}.jar"
 
  #Creates launcher
  cd "${pkgdir}/"
  mkdir -p usr/bin/
  touch usr/bin/${pkgname}
  echo "#!/bin/sh" > usr/bin/bfg-repo-cleaner
  echo "exec /usr/bin/java -jar '/usr/share/java/bfg/bfg-${pkgver}.jar' \"\$@\"" >> usr/bin/${pkgname}
  chmod 755 usr/bin/${pkgname}
} 
