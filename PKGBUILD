# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-demos
_major=8
_minor=121
_build=b13
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Demos and samples of common tasks and new functionality in Oracle Java $_major Development Kit"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-runtime>=$_major: Run examples"
            "java-environment>=$_major: Compile and run examples"
            "gradle: Compile examples")
options=('!strip')
source_i686=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build-demos/e9e7ea248e2c4826b92b3f075a80e441/jdk-$pkgver-linux-i586-demos.tar.gz")
source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build-demos/e9e7ea248e2c4826b92b3f075a80e441/jdk-$pkgver-linux-x64-demos.tar.gz")
md5sums_i686=('3f514d95d0c47fb778797d376512f0b0')
md5sums_x86_64=('927dfb4c076ac2b5a757fdb04b8e1453')

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
