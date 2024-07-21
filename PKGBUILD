# Maintainer: tarball <bootctl@gmail.com>

_java=22

pkgname=mandrel24-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=24.0.2.0
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

sha256sums_x86_64=('5bff8df90796359f8e42f74d6e06c6e53016c3c08a5a05361a581cef1d3e01f4')
sha256sums_aarch64=('98dc36277ed4f315449a0a14629d29a4bf61b73c90e9fa900f5bb7f3bea3d3be')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
