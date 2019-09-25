# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=2.0.0
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("meson")

source=("https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz")
sha256sums=("2916e8744b46cac45f769a59e01516afd2531508c9d5070efd60de5b953ca5cf")

build() {
  cd "ashuffle-${pkgver}"

  arch-meson builddir \
    -Dtidy_mode=true
  # disabling tests because the tarball is missing t/libtap/tap.c
  # See: https://github.com/joshkunz/ashuffle/issues/37

  ninja -C builddir
}

#check() {
#  cd "ashuffle-${pkgver}"
#
#  ninja -C builddir test
#}

package() {
  cd "ashuffle-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C builddir install

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
