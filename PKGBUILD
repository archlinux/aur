# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=keepassxc-cryptomator
pkgver=0.0.2
pkgrel=1
pkgdesc="Store Cryptomator vault passwords in KeePassXC"
arch=('x86_64')
url="https://plugin.purejava.org/"
license=('MIT')
depends=('java-environment=16' 'cryptomator' 'keepassxc')
makedepends=('maven')
source=("keepassxc-cryptomator-${pkgver}::https://github.com/purejava/keepassxc-cryptomator/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cfe68ed729cb21c580fd39c9c668c113d6654a91500e4a8efc22cce6ebe3ff64')
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
