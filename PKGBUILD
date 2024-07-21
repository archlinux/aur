# Maintainer: tarball <bootctl@gmail.com>

_java=21

pkgname=mandrel-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=23.1.4.0
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/graalvm/mandrel
license=(custom)
depends=(
  alsa-lib
  bash
  freetype2
  glibc
  java-environment-common
  java-runtime-common
  libx11
  libxext
  libxi
  libxrender
  libxtst
  zlib
)
provides=(java-runtime=$_java java-environment=$_java mandrel)
options=(staticlibs)

_fullver="$pkgver-Final"
_urlbase="https://github.com/graalvm/mandrel/releases/download/mandrel-$_fullver/mandrel-java$_java-linux"

source_x86_64=("$_urlbase-amd64-$_fullver.tar.gz")
source_aarch64=("$_urlbase-aarch64-$_fullver.tar.gz")

sha256sums_x86_64=('2b992e8621d93af541353d857ceeffbab0e8ac38257d3ff2404ba6f6486bbea4')
sha256sums_aarch64=('2f80e4c9a0d1b908ece3b46b8296f815bc8563aeaed0fff7a66709e2801f485e')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
