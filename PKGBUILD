# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_buildver=0.8.0-dev.2602+7cd9b30e0

pkgname=zig-dev-bin
pkgver=20210523
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=('x86_64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig')
conflicts=('zig')
source=(
  "https://ziglang.org/builds/zig-linux-x86_64-${_buildver}.tar.xz"
)
sha256sums=(
  '270aba8ff564497aaa8b603090ff74de252ed102c7adbe961868556eb3f05912'
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
