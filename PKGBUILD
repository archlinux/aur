# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=8.0.0
pkgrel=1
pkgdesc="OpenJDK Mission Control"
arch=('x86_64')
license=('UPL')
url="https://adoptopenjdk.net/jmc.html"
depends=('java-environment')
optdepends=()
options=(!strip)
source=(
  "org.openjdk.jmc-linux.gtk.x86_64.tar.gz"::"https://ci.adoptopenjdk.net/view/JMC/job/jmc-build/job/8.x.x/lastSuccessfulBuild/artifact/target/products/org.openjdk.jmc-8.0.0-linux.gtk.x86_64.tar.gz"
  "jdk-mission-control.desktop"
)
sha512sums=('86d11b9da5360cc484e601d931faee28ce6af11692bf6f018df3fa4d4ea44661f1396e7fd399fe50766e767ccb295d3b225e329a7dbf789b5227119468218a58' 'SKIP')

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

  ln -sf "/opt/jdk-mission-control/JDK Mission Control/jmc" "${pkgdir}/usr/bin/jmc" 
}
