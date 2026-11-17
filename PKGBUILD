# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
# Contributor: Adam Brenner <adam@aeb.io>

pkgname=pulsar
pkgver=5.0.1
pkgrel=1
pkgdesc='Distributed pub-sub messaging system'
arch=('x86_64' 'aarch64')
url='https://github.com/apache/pulsar'
license=('Apache-2.0')
provides=('pulsar-shell')
makedepends=('java-environment=21'
)
depends=('java-runtime=21' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2940a27da1f26dbac3e2cf7ef5d7c63a116bb364ad318f542d19dcf1c61d9a49')

build() {
    cd ${pkgname}-${pkgver}
    ./gradlew assemble
}

check(){
    cd ${pkgname}-${pkgver}
    ./gradlew sanityCheck  
}

package() {
  cd ${pkgname}-${pkgver}/distribution
  install -d ${pkgdir}/opt/${pkgname}/
  install -dm777 ${pkgdir}/opt/${pkgname}/logs
  cp -r licenses/ ${pkgdir}/opt/${pkgname}

  tar -xzf server/build/distributions/apache-${pkgname}-${pkgver}-bin.tar.gz \
    --strip-components=1 -C ${pkgdir}/opt/${pkgname}/
  tar -xzf shell/build/distributions/apache-${pkgname}-shell-${pkgver}-bin.tar.gz \
    --strip-components=1 -C ${pkgdir}/opt/${pkgname}/
}
