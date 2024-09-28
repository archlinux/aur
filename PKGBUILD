# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=latencyflex
pkgname=$_pkgname-bin
pkgver=0.1.1
pkgrel=4
pkgdesc="Vendor and game agnostic latency reduction middleware (binary release)"
url="https://github.com/ishitatsuyuki/LatencyFleX"
license=('Apache-2.0')
arch=('x86_64')
optdepends=("latencyflex-proton-ge-custom: symlinks for proton-ge-custom (and -bin) system installation")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver.tar.xz")
sha256sums=('c992ebd2f43c99ab4a84a6ffce692d9aae4cc2571536a5854ae2e79b6951e78a')

prepare() {
# Edit the lib path in the latencyflex.json file
  cd $_pkgname-v$pkgver/layer/usr/share/vulkan/implicit_layer.d
  sed -i -E "s|                \"library_path\": \"/usr/lib/x86_64-linux-gnu/liblatencyflex_layer.so\",|                \"library_path\": \"/usr/lib/liblatencyflex_layer.so\",|g" $_pkgname.json
}

package() {
  cd $_pkgname-v$pkgver
  mv wine/usr "$pkgdir"
  install -Dm644 layer/usr/share/vulkan/implicit_layer.d/$_pkgname.json -t "$pkgdir/usr/share/vulkan/implicit_layer.d"
  install -Dm755 layer/usr/lib/x86_64-linux-gnu/lib${_pkgname}_layer.so -t "$pkgdir/usr/lib"
}
