# Maintainer: Reza Farrahi M <imriss@yahoo.com>

pkgname=jgnash-git
pkgnameorg=jgnash
pkgver=2.34.0
pkgrel=1
pkgdesc="Cross platform personal finance application written in Java - Build from GitHub"
arch=('any')
url="http://sourceforge.net/projects/jgnash/"
license=('GPL3')
provides=('jgnash')
conflicts=('jgnash')
depends=('java-runtime' 'jdk8-openjdk' 'java-rhino' 'java-openjfx' 'rhino' 'gradle' 'java-environment-common' 'java-runtime-common')
source=(https://github.com/ccavanaugh/jgnash/archive/master.tar.gz)
sha256sums=('f2fca192d0cebb8d652a0a31b92246d14cb6c757db4082c41d9a8a502878b32e')
md5sums=('df15d3113997274f751aad61c2a8214f')

prepare() {
  cd "${srcdir}"/jgnash-master
  gradle --stacktrace -g /tmp clean DistTar
}

package() {
  cd "${srcdir}"/jgnash-master/jgnash-fx/build/distributions
  tar -xvf jGnash-$pkgver.tar
  cd jGnash-$pkgver/

  install -d "${pkgdir}"/usr/share/java/$pkgnameorg
  cp -r * "${pkgdir}"/usr/share/java/$pkgnameorg

  install -d "${pkgdir}"/usr/bin
  ln -s "${pkgdir}"/usr/share/java/$pkgnameorg/bin/jgnash-fx "${pkgdir}"/usr/bin/$pkgnameorg 
  chmod +x "${pkgdir}"/usr/bin/$pkgnameorg
}

