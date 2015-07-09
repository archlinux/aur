# Maintainer: Tomas Storck <storcktomas@gmail.com>
pkgname=java-jmatio
_shortname=jmatio	# Name used by author, for destination and .jar file
pkgver=1.1		# This will be updated by the pkgver()
pkgrel=1
pkgdesc="Matlab's MAT-file I/O in JAVA"
arch=('any')
url="https://github.com/gradusnikov/jmatio"
license=('BSD')
depends=('java-environment')
makedepends=('git' 'maven')
source=('git+https://github.com/gradusnikov/jmatio.git')
noextract=()
sha256sums=('SKIP') 

pkver() {
  cd "$srcdir/${_shortname}"
  mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | grep -Ev '(^\[|Download\w+:)'	# From http://stackoverflow.com/questions/3545292/how-to-get-maven-project-version-to-the-bash-command-line
}

build() {
  cd "$srcdir/${_shortname}"
  mvn package
}

package() {
  cd "$srcdir/${_shortname}"
  install -Dm644 "$srcdir/${_shortname}/target/${_shortname}-${pkgver}.jar" "$pkgdir/usr/share/java/${_shortname}/${_shortname}.jar"
  install -Dm644 "$srcdir/${_shortname}/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
