# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=8.0.0
pkgrel=2
pkgdesc="OpenJDK Mission Control"
arch=('x86_64')
license=('UPL')
url="https://adoptopenjdk.net/jmc.html"
depends=('java-environment')
optdepends=()
options=(!strip)
source=(
  "org.openjdk.jmc-linux.gtk.x86_64.tar.gz"::"https://github.com/AdoptOpenJDK/openjdk-jmc-overrides/releases/download/8.0.0/org.openjdk.jmc-8.0.0-linux.gtk.x86_64.tar.gz"
  "jdk-mission-control.desktop"
)
sha512sums=('b7a60b41772c8c847e1934363f4f81b1c60f603b9ae12aefe654decb40a35abd51040d26096f16e8218cb77430689080e0620680b048c57d836d593b4fcb6979' 'SKIP')

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
