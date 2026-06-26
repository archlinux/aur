# Maintainer: Uladzislau Bolbas <cmrtumilovic@gmail.com>

pkgname=gisp
pkgver=1.1
pkgrel=1
pkgdesc="File encryption utility using XChaCha20-Poly1305 and Argon2id"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://codeberg.org/artich0ke/gisp"
license=('GPL-3.0-or-later')
depends=('libsodium')
makedepends=('gcc' 'make' 'autoconf' 'automake' 'gettext' 'texinfo' 'pkgconf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/artich0ke/gisp/archive/v${pkgver}.tar.gz")
sha256sums=('545b5fd3a136118ca7a1d830bf2ce539aa0fe0b3adddbfb9f75ae9632412cea5')

build() {
  cd "$pkgname"
  # The release archive is a plain git export, so generate the build system.
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  # The info "dir" index is owned by the system, not by this package; the
  # gisp.install scriptlet registers gisp.info instead.
  rm -f "$pkgdir/usr/share/info/dir"
}
