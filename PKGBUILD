# Maintainer: splatch

pkgname=mvnd2
pkgver=2.0.0_rc3
mvndver=2.0.0-rc-3
pkgrel=1
pkgdesc="Maven 4.x based Deamon, which aims at providing faster Maven builds using techniques known from Gradle and Takari."
arch=(x86_64)
conflicts=(mvnd)
provides=(mvnd)
url=https://github.com/apache/maven-mvnd
license=('Apache')
depends=('java-environment>=17' 'bash' 'maven')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/maven-mvnd/releases/download/${mvndver}/maven-mvnd-${mvndver}-linux-amd64.tar.gz")
sha256sums=('3551f537cc0bcb004c5d02dbe98528a74771d1e531af0cf8518bb22ea3415222')

package() {
  install -d "${pkgdir}/opt/mvnd"
  bsdtar xf mvnd-${pkgver}.tar.gz \
    --strip-components=1 \
    -C "${pkgdir}/opt/mvnd"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/mvnd/bin/mvnd "${pkgdir}/usr/bin/mvnd"
}

post_install() {
    echo -e "\e[1;33mNote: ohmyzsh user who use default maven completion plugin may need to unailas mvnd."
    echo -e "\e[1;33mNote: use \e[1;0mcp /usr/share/java/mvnd/conf/mvnd.properties \e[1;33mto copy default mvnd config file."
}

