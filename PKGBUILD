# Contributor: Adrian Petrescu <apetresc at gmail dot com>
# Maintainer: Adrian Petrescu <apetresc at gmail dot com>

pkgname=lizzie
pkgver=0.5
pkgrel=1
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero-git')
makedepends=('git' 'maven')
source=("${pkgname}::git+https://github.com/apetresc/lizzie#tag=v0.5-apetresc"
        'lizzie.desktop')
md5sums=('SKIP'
         '1fefb91214fd8fd2f1241de2b73f8701')


build() {
  cd $srcdir/$pkgname

  mvn package
}

check() {
  cd $srcdir/$pkgname

  mvn test
}

package() {
  cd $srcdir/$pkgname

  install -Dm644 ${srcdir}/${pkgname}/target/lizzie-${pkgver}-shaded.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
