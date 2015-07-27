# Maintainer: Miguel Useche <migueluseche@skatox.com>

pkgname=bfg-repo-cleaner
pkgver=1.12.3
pkgrel=1
pkgdesc="Removes larges or troublesome blobs like git-filter-branch does, but faster"
arch=('any')
url="https://rtyley.github.io/bfg-repo-cleaner/"
license=('GPL')
depends=('java-runtime' 'git')
source=("http://repo1.maven.org/maven2/com/madgag/bfg/${pkgver}/bfg-${pkgver}.jar")
noextract=("bfg-${pkgver}.jar")
sha512sums=('c55aaf76004f92fe13294bd54221646b3c7ccd9aaab46b7418fbcb417dfa632de1011608cf7ab9ff85c6c34b4cef1885327ad40e45beb26b27e97753990a0737')
install=bfg-repo-cleaner.install

package() {
  install -Dm644 "${srcdir}/bfg-${pkgver}.jar" "${pkgdir}/usr/share/java/bfg/bfg-${pkgver}.jar"
 
  #Creates launcher
  cd "${pkgdir}/"
  mkdir -p usr/bin/
  touch usr/bin/${pkgname}
  echo "#!/bin/sh" > usr/bin/bfg-repo-cleaner
  echo "exec /usr/bin/java -jar '/usr/share/java/bfg/bfg-${pkgver}.jar' \"$@\"" >> usr/bin/${pkgname}
  chmod 755 usr/bin/${pkgname}
} 
