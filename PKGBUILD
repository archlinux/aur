# Maintainer: tarball <bootctl@gmail.com>

_java=17

pkgname=mandrel-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=22.3.2.0
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

sha256sums_x86_64=('39b3ffc79e5ae4adfecdbb1c13cb25b2a305fc6206b4ba3222b0f00a0389fc9f')
sha256sums_aarch64=('e0d166a8fa9c18a916228a846252fe3510fbc64655ebe080bbda88f3a6e9c19d')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
