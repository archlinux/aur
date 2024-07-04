# Maintainer: tarball <bootctl@gmail.com>

_java=21

pkgname=mandrel-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=23.1.3.1
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

sha256sums_x86_64=('d86cbe27389054b9724b09f99ed237026e47a35bd5199bf9b05d61af117ddbe0')
sha256sums_aarch64=('7b8b30585c9e5a6922f813e97214f37f912ebf1a9924720a03548d4d20295258')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
