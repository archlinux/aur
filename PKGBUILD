# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname='binnavi'
pkgver=6.0.0
pkgrel=1
pkgdesc="BinNavi is a binary analysis IDE that allows to inspect, navigate, edit
and annotate control flow graphs and call graphs of disassembled code"
arch=('any')
url="https://github.com/google/binnavi"
license=('Apache')
builddepends=('maven' 'apache-ant')
depends=('java-environment>=7')
source=('https://github.com/google/binnavi/archive/v6.0.0.tar.gz')
sha512sums=('93f9e726b1a1a8e6079f09d02ef6bc8a13c7427b92d39fd2b41d6c5e0266eede611d1d0d2a745443f37aa5344d3598c7d8595483ba5f086228f86fefe5da0858')

build(){
  cd "${srcdir}/$pkgname-$pkgver"
  mvn dependency:copy-dependencies
  ant -f src/main/java/com/google/security/zynamics/build.xml \
  build-binnavi-fat-jar 
}

package() {
  mkdir -p "${pkgdir}/opt/binnavi"
  cd "${srcdir}/target/" 
  mv * "${pkgdir}/opt/binnavi/*"   
}
