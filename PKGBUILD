# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=20200507142353
pkgrel=1
pkgdesc="OpenJDK Mission Control"
arch=('x86_64')
license=('UPL')
url="https://adoptopenjdk.net/jmc.html"
depends=('java-environment')
optdepends=()
options=(!strip)
source=("org.openjdk.jmc-linux.gtk.x86_64.tar.gz"::"https://ci.adoptopenjdk.net/view/JMC/job/jmc-build/job/master/lastSuccessfulBuild/artifact/target/products/org.openjdk.jmc-linux.gtk.x86_64.tar.gz")
sha512sums=('SKIP')

pkgver() {
  echo $(curl -I https://ci.adoptopenjdk.net/view/JMC/job/jmc-build/job/master/lastSuccessfulBuild/artifact/target/products/org.openjdk.jmc-linux.gtk.x86_64.tar.gz | grep 'Last-Modified' | sed 's/Last-Modified: //' | xargs -I {} date --date {} -u +"%Y%m%d%H%M%S")
}

package() {
  local LIBDIR="${pkgdir}/usr/lib/openjdk-mission-control"
  mkdir -p "$LIBDIR"
	cp -a --no-preserve=ownership ./* "$LIBDIR"

  mkdir -p "${pkgdir}/usr/bin"

  ln -sf "/usr/lib/openjdk-mission-control/jmc" "${pkgdir}/usr/bin/jmc" 
}
