# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Det <nimetonmaili g-mail>

pkgname=jdk-demos
_major=8
_minor=202
_build=b08
_hash=1961070e4c9b4e26a04e7f5a083f551e
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Demos and samples of common tasks and new functionality in Oracle Java $_major Development Kit"
arch=('x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=("java-environment>=$_major")
optdepends=('gradle: Compile examples')
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build-demos/$_hash/jdk-$pkgver-linux-x64-demos.tar.gz")
sha256sums=('9c4d2a5c7a7f3d993b2ff14674704aad6c3912b274cc2c2fa1f554cff3b07fc5')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  cd jdk1.$_major.0_$_minor

  # Install
  install -d "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/
  mv demo/ sample/ "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/

  # README
  mv "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/demo/README \
     "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/README

  # License
  install -Dm644 "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/demo/DEMOS_LICENSE \
                 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Clean up
  rm "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/demo/DEMOS_LICENSE
  rm "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/sample/README
  rm "$pkgdir"/usr/lib/jvm/java-$_major-jdk/demos/sample/SAMPLES_LICENSE
}
# vim:set ts=2 sw=2 et:
