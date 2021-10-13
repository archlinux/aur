# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=keepassxc-cryptomator
pkgver=0.0.3
pkgrel=1
pkgdesc="Store Cryptomator vault passwords in KeePassXC"
arch=('x86_64')
url="https://plugin.purejava.org/"
license=('MIT')
depends=('java-environment=17' 'cryptomator' 'keepassxc')
makedepends=('maven')
source=("keepassxc-cryptomator-${pkgver}::https://github.com/purejava/keepassxc-cryptomator/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f25cd9ba9bd446d12f9430490781a29ec97dbd1913e09033919e7d6ca52e4292')
options=('!strip')

build() {
  cd "${srcdir}/keepassxc-cryptomator-${pkgver}"
  mvn -B clean package --file pom.xml
}

package() {
  mkdir -p "${pkgdir}/opt/keepassxc-cryptomator/"
  cp -R "${srcdir}/keepassxc-cryptomator-${pkgver}/target/keepassxc-cryptomator-${pkgver}.jar" ${pkgdir}/opt/keepassxc-cryptomator/

  mkdir -p "${pkgdir}/usr/local/share/Cryptomator/plugins"
  ln -s "/opt/keepassxc-cryptomator/keepassxc-cryptomator-${pkgver}.jar" "${pkgdir}/usr/local/share/Cryptomator/plugins/keepassxc-cryptomator-${pkgver}.jar"
}
