# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
pkgname='binnavi'
pkgver=6.0.0
pkgrel=4
pkgdesc="A binary analysis IDE that allows to inspect, navigate, edit and annotate control flow graphs and call graphs of disassembled code"
arch=('any')
url="https://github.com/google/binnavi"
license=('Apache')
makedepends=('maven' 'apache-ant' 'java-environment>=7')
depends=('java-runtime>=7' 'postgresql')
source=('https://github.com/google/binnavi/archive/v6.0.0.tar.gz' 'binnavi')
sha512sums=('93f9e726b1a1a8e6079f09d02ef6bc8a13c7427b92d39fd2b41d6c5e0266eede611d1d0d2a745443f37aa5344d3598c7d8595483ba5f086228f86fefe5da0858'
            'bb274ca29a994ef8b98aa77e0be745e297bd2f7e65dd394594169ffec3910b4dd4982e353202c6b201472632a3f7b16bd7d905b7006e21d76b7299b78fc7f390')

build(){
  cd "${srcdir}/$pkgname-$pkgver"
  mvn dependency:copy-dependencies -Dmaven.repo.local="${srcdir}/$pkgname-$pkgver"
  ant -f src/main/java/com/google/security/zynamics/build.xml \
    build-binnavi-fat-jar 
}

package() {
  mkdir -p "${pkgdir}/usr/share/java/binnavi"
  cd "${srcdir}/$pkgname-$pkgver/target/" 
  mv binnavi-all.jar "${pkgdir}/usr/share/java/binnavi/"
  install -D -m755 "${srcdir}/binnavi" "${pkgdir}/usr/bin/binnavi"
}

# vim:set et sw=2 ts=2 tw=80:
