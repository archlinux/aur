# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.3.4
pkgrel=1
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache-2.0')
depends=('java-environment=8' 'java-openjfx')
makedepends=('maven' 'unzip')
source=("https://github.com/ACINQ/eclair/archive/v0.3.4.tar.gz")
md5sums=('f46ba8d738f5bb38593c7d3b8609dd35')

build() {
  cd ${pkgname}-${pkgver}
  mvn package -DskipTests
}

package() {
  mkdir -p "${pkgdir}/opt"
  unzip ${pkgname}-${pkgver}/eclair-node-gui/target/eclair-node-gui-${pkgver}-*-bin.zip -d "${pkgdir}/opt"
  mv "${pkgdir}/opt"/eclair* "${pkgdir}/opt"/eclair
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/eclair/bin/eclair-cli "${pkgdir}/usr/bin/eclair"
  ln -s /opt/eclair/bin/eclair-node-gui.sh "${pkgdir}/usr/bin/eclair-node-gui"
  install -Dm644 "${pkgdir}/opt/eclair/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}/contrib/eclair-cli.bash-completion" -t "${pkgdir}/etc/profile.d/"
  rm "${pkgdir}/opt/eclair/bin/eclair-node-gui.bat"
  rm "${pkgdir}/opt/eclair/LICENSE"
}