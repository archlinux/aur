# Maintainer: tarball <bootctl@gmail.com>

_java=21

pkgname=mandrel-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=23.1.1.0
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
provides=(java-runtime=$_java java-environment=$_java)
options=(staticlibs)

_fullver="$pkgver-Final"
_urlbase="https://github.com/graalvm/mandrel/releases/download/mandrel-$_fullver/mandrel-java$_java-linux"

source_x86_64=("$_urlbase-amd64-$_fullver.tar.gz")
source_aarch64=("$_urlbase-aarch64-$_fullver.tar.gz")

sha256sums_x86_64=('d0233157fed52ee41e1008a9b4da76e241528015d237c98e308c16d7b86cec5a')
sha256sums_aarch64=('01b6b0888cbaaacf04d70daa8d6538e514dbab228c602815adc6b40e7a31b88a')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
