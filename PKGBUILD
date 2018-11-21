# Maintainer: algebro <algebro at tuta dot io>
# Contributor: Adrian Petrescu <apetresc at gmail dot com>

pkgname=lizzie-git
_pkgname=lizzie
pkgver=0.6.r19.g6fa818e
_pkgver=0.6
pkgrel=1
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero-git')
makedepends=('git' 'maven')
source=("git+https://github.com/featurecat/lizzie.git"
        "network.gz::http://zero.sjeng.org/best-network"
        "lizzie.desktop")
noextract=("network.gz")
md5sums=('SKIP'
         'SKIP'
         '1fefb91214fd8fd2f1241de2b73f8701')

pkgver() {
  cd lizzie
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
  mv network.gz lizzie/
  cd lizzie
  mvn package
}

check() {
  cd lizzie
  mvn test
}

package() {
  install -Dm644 "$_pkgname"/target/lizzie-"$_pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
  install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
}
