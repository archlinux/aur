# Maintainer: tarball <bootctl@gmail.com>

_java=17

pkgname=mandrel-bin
pkgdesc="Mandrel is a downstream distribution of the GraalVM community edition. Mandrel's main goal is to provide a native-image release specifically to support Quarkus."
pkgver=22.3.1.0
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/graalvm/mandrel
license=(custom)
depends=(java-runtime-common java-environment-common)
provides=(java-runtime=$_java java-environment=$_java)
options=(staticlibs)

_fullver="$pkgver-Final"
_urlbase="https://github.com/graalvm/mandrel/releases/download/mandrel-$_fullver/mandrel-java$_java-linux"

source_x86_64=("$_urlbase-amd64-$_fullver.tar.gz")
source_aarch64=("$_urlbase-aarch64-$_fullver.tar.gz")

sha256sums_x86_64=('3c31169724c1fa23dc5cf5688d9d7f90d0d7bef9e90c9aea2419db9eb946b62c')
sha256sums_aarch64=('e1146e100bf97c4adb67814fc7f6b52928eee02b61d5e54a789e1a590ac50fb0')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
