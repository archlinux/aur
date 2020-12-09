# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=7.1.1
pkgrel=1
pkgdesc="OpenJDK Mission Control"
arch=('x86_64')
license=('UPL')
url="https://adoptopenjdk.net/jmc.html"
depends=('java-environment')
optdepends=()
options=(!strip)
source=(
  "org.openjdk.jmc-linux.gtk.x86_64.tar.gz"::"https://ci.adoptopenjdk.net/view/JMC/job/jmc-build/job/7.x.x/lastSuccessfulBuild/artifact/target/products/org.openjdk.jmc-7.1.1-linux.gtk.x86_64.tar.gz"
  "jdk-mission-control.desktop"
)
sha512sums=('b6d39341f5aca10dfbb40748e7ef8e728c19047493be1680de2395fc7424f7315b69179f8305a319690b7068d644094a35ee6c7d738e07a6c8ba3e5470746b21' 'SKIP')

# pkgver() {
#   echo $(curl -I https://ci.adoptopenjdk.net/view/JMC/job/jmc-build/job/master/lastSuccessfulBuild/artifact/target/products/org.openjdk.jmc-linux.gtk.x86_64.tar.gz | grep 'Last-Modified' | sed 's/Last-Modified: //' | xargs -I {} date --date {} -u +"%Y%m%d%H%M%S")
# }

package() {

  local LIBDIR="${pkgdir}/opt/jdk-mission-control"
  mkdir -p "$LIBDIR"
  rm ./org.openjdk.jmc-linux.gtk.x86_64.tar.gz
	cp -a --no-preserve=ownership ./* "$LIBDIR"

  mkdir -p "${pkgdir}/usr/bin"

  install -D -m644 "jdk-mission-control.desktop" \
      "${pkgdir}/usr/share/applications/jdk-mission-control.desktop"

  ln -sf "/opt/jdk-mission-control/jmc" "${pkgdir}/usr/bin/jmc" 
}
