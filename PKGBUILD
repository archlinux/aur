# Maintainer: Miguel Useche <migueluseche@skatox.com>

pkgname=bfg-repo-cleaner
pkgver=1.12.4
pkgrel=1
pkgdesc="Removes larges or troublesome blobs like git-filter-branch does, but faster"
arch=('any')
url="https://rtyley.github.io/bfg-repo-cleaner/"
license=('GPL')
depends=('java-runtime' 'git')
source=("http://repo1.maven.org/maven2/com/madgag/bfg/${pkgver}/bfg-${pkgver}.jar")
noextract=("bfg-${pkgver}.jar")
sha512sums=('1839117982c583ee3bbdde763f0365319b3ff250bc34c9a276c8e08da8126e2a3e9c9a2ad683094c6eb00e7e3365295fe47001eab66b81a4f2f75c4c148b7983')
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
