# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=8.1.0
pkgrel=1
pkgdesc="OpenJDK Mission Control"
arch=('x86_64')
license=('UPL')
url="https://adoptopenjdk.net/jmc.html"
depends=('java-environment')
optdepends=()
options=(!strip)
source=(
  "org.openjdk.jmc-linux.gtk.x86_64.tar.gz"::"https://github.com/adoptium/jmc-overrides/releases/download/8.1.0/org.openjdk.jmc-8.1.0-linux.gtk.x86_64.tar.gz"
  "jdk-mission-control.desktop"
)
sha512sums=('b22aa01440cd88e64841b9a59be625ef3ed53b051950004f8aca50a7091572b65461526c41b8945e23683980bb9dc029a2f51f0fd3662364c9ed783d6576038a' 'SKIP')

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
