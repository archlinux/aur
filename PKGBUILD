# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_buildver=0.10.0-dev.2186+3a64693db

pkgname=zig-dev-bin
pkgver=20220512
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=('x86_64')
url="https://ziglang.org/"
license=('MIT')
options=('!strip')
provides=('zig')
conflicts=('zig')
source=(
  "https://ziglang.org/builds/zig-linux-x86_64-${_buildver}.tar.xz"
)
sha256sums=(
  'b0f5261190edfcb9a45db4cce300ea1ef9a68af869cb5a77239a8e3896d875f4'
)

package() {
  cd "${srcdir}/zig-linux-x86_64-${_buildver}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/zig"
  cp -R lib "${pkgdir}/usr/lib/zig/lib"
  install -D -m755 zig "${pkgdir}/usr/lib/zig/zig"
  ln -s /usr/lib/zig/zig "${pkgdir}/usr/bin/zig"
  install -D -m644 docs/langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
  cp -R docs/std "${pkgdir}/usr/share/doc/zig/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
