# Contributor: Patrick Wozniak <email@patwoz.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-cli
pkgver=2.6
_relver=5
_hash=g344771db
pkgrel=3
pkgdesc='CLI version of Master Password'
arch=('i686' 'x86_64')
url='https://masterpassword.app/'
license=('GPL3')
depends=('ncurses' 'json-c' 'libsodium')
makedepends=('openssl')
optdepends=('xclip: copy password to clipboard')
source=("https://masterpassword.app/mpw-${pkgver}-cli-${_relver}-0-${_hash}.tar.gz"{,.sig})
sha256sums=('954c07b1713ecc2b30a07bead9c11e6204dd774ca67b5bdf7d2d6ad1c4eec170'
            'SKIP')
validpgpkeys=('5C2D1D61853F20F2FCDDCCB70EF21226F43EA6BC') # Maarten Billemont

build() {
  export LDFLAGS="$LDFLAGS -ltinfo"
  ./build
}

check() {
  ./mpw-cli-tests
}

package() {
  /usr/bin/install -Dm755 mpw "$pkgdir/usr/bin/mpw"
}
