# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="c4ee870d30af5c5a37f8d4a2eb05197ae7ec4a1e"
pkgname="xmousepasteblock"
pkgver="1.4"
pkgrel="3"
pkgdesc="Userspace tool to disable middle mouse button paste in Xorg"
arch=("i686" "x86_64")
url="https://github.com/milaq/XMousePasteBlock"
license=("GPL")
conflicts=(
  # FIXME: xmousepasteblock-git should conflict with xmousepasteblock,
  # not the other way around.
  "xmousepasteblock-git"
)
depends=(
  "libxi"
  "libx11"
  "libev"
  "libxfixes"
)
makedepends=(
  "git"
)
source=(
  "xmpb::git+https://github.com/milaq/XMousePasteBlock.git#commit=${_commit}"
)
sha256sums=(
  "SKIP"
)

build() {
  cd "${srcdir}/xmpb"
  make all
}

package() {
  cd "${srcdir}/xmpb"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 \
    "${srcdir}/xmpb/xmousepasteblock.service" \
    -t "${pkgdir}/usr/lib/systemd/user"
}
