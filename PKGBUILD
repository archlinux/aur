# Maintainer: algebro <algebro at tuta dot io>
# Contributor: Adrian Petrescu <apetresc at gmail dot com>

pkgname=lizzie-git
_pkgname=lizzie
pkgver=0.7.4.r8.gebeb446
_pkgver=0.7.4
pkgrel=1
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero-git')
makedepends=('git' 'maven')
provides=('lizzie')
conflicts=('lizzie')
source=("git+https://github.com/featurecat/lizzie.git"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt")
sha256sums=('SKIP'
            '58a4987ab4167aab557e1bcd2bb22daec252ce7c6397e76040c038516b74de70'
            'cf5d1651023f04294e580243aa7ef05bc9ebedb468631f4035fd3d5ce0f212f0'
            '3487a0b90ca9340abbd456d47f5dcd8cbaa2876625a4122d732f0a77f09f6caf')

pkgver() {
  cd lizzie
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
  cd lizzie
  mvn package
}

check() {
  cd lizzie
  mvn test
}

package() {
  install -Dm644 "$_pkgname"/target/lizzie-"$_pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
  install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
  install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
}
