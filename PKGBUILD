# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

pkgname="readpe"
pkgver="0.85.1"
pkgrel="2"
pkgdesc="PE file analysis toolkit"
arch=("x86_64")
url="https://github.com/mentebinaria/readpe"
license=(
  "LicenseRef-GPL-2.0-or-later-with-OpenSSL-exception AND LGPL-3.0-or-later"
)
conflicts=("pev")
depends=("openssl")
makedepends=("git")
source=(
  "readpe::git+https://github.com/mentebinaria/readpe.git#tag=v${pkgver}"
)
sha256sums=(
  "bf4e004284fb511dd1f50a7cba7a2949c2cc431f566ace7d80d1cd2f455648e4"
)

build() {
  cd "${srcdir}/readpe"
  make prefix="/usr"
}

package() {
  cd "${srcdir}/readpe"
  make prefix="/usr" DESTDIR="${pkgdir}" install

  install -Dm644 \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    "${srcdir}/readpe/LICENSE.OpenSSL"
}
