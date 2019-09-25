# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=2.0.1
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("meson")

source=("https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz")
sha256sums=("7b1ce117568de33e26bcc762c0fba8c1a487952d93668358d10ae0dd52d5c487")

build() {
  cd "ashuffle-${pkgver}"

  arch-meson builddir

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
