# Maintainer: tarball <bootctl@gmail.com>

_java=17

pkgname=mandrel-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=23.0.0.0
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

sha256sums_x86_64=('3b5d4ea87f6c1cac698942068702e111ad44fd975517fb859aac11dd573f6dbb')
sha256sums_aarch64=('5ee2ad025929fb4ea6f3c7c1933b04dbd9b5efd75d7c4ee7d82dd0cd47cafd9b')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
