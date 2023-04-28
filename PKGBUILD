# Maintainer: tarball <bootctl@gmail.com>

_java=17

pkgname=mandrel-bin
pkgdesc='Downstream distribution of the GraalVM CE for the Quarkus web framework'
pkgver=22.3.2.1
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

sha256sums_x86_64=('7c9f0cfc18137fd1ae976d9a4aacbadf764a6a07c7691481a8d8d9b78903212a')
sha256sums_aarch64=('95995f1b99eb9323e214ea147624651366129b9cfb3e07590eeac59f02f47ed4')

package() {
  local _dest="$pkgdir/usr/lib/jvm/java-${_java}-mandrel/"
  cd "mandrel-java$_java-$_fullver"
  mkdir -p "$_dest"
  cp -a -t "$_dest" *
  install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
