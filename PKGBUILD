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
sha512sums=('86e4934e9bca92d66cd912da701e22c84a4d03c1be6af8aac624354dea5aa48abf92214b00f86cfbe6dc9ce24574b32f0f2e173bd0453478944d94fdf057be97' 'SKIP')

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
