# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-demos
_major=8
_minor=162
_build=b12
_hash=0da788060d494f5095bf8624735fa2f1
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Demos and samples of common tasks and new functionality in Oracle Java $_major Development Kit"
arch=('x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-runtime>=$_major: Run examples"
            "java-environment>=$_major: Compile and run examples"
            "gradle: Compile examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build-demos/$_hash/jdk-$pkgver-linux-x64-demos.tar.gz")
md5sums=('847cf2f5d6464001841d1a79cd7b61b8')

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
