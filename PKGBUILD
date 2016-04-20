# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-demos
_major=8
_minor=92
_build=b14
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Demos and samples of common tasks and new functionality in Oracle Java $_major Development Kit"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-runtime>=$_major: Run the examples"
            "java-environment>=$_major: Compile and run the examples")
makedepends=('pacman>=4.2.0')
options=('!strip')
source_i686=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build-demos/jdk-$pkgver-linux-i586-demos.tar.gz")
source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build-demos/jdk-$pkgver-linux-x64-demos.tar.gz")
md5sums_i686=('04ecff4b7cc01502b1828c5e471f194a')
md5sums_x86_64=('1e37806ddf0d5ca7b815e036bb8c4045')

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
