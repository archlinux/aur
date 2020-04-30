# Contributor: Patrick Wozniak <email@patwoz.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-cli
pkgver=2.6
_relver=5
_hash=g344771db
pkgrel=4
pkgdesc='CLI version of Master Password'
arch=('i686' 'x86_64')
url='https://masterpassword.app/'
license=('GPL3')
depends=('ncurses' 'json-c' 'libsodium')
makedepends=('openssl')
optdepends=('xclip: copy password to clipboard')
source=("https://masterpassword.app/mpw-${pkgver}-cli-${_relver}-0-${_hash}.tar.gz"{,.sig}
        'fix-build.patch')
sha256sums=('954c07b1713ecc2b30a07bead9c11e6204dd774ca67b5bdf7d2d6ad1c4eec170'
            'SKIP'
            'ae6cb494dba01f9941580840e7412b91973c7767cae75c935d8dd2fd2392adc3')
validpgpkeys=('5C2D1D61853F20F2FCDDCCB70EF21226F43EA6BC') # Maarten Billemont

prepare() {
  patch -p0 -i fix-build.patch
}

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
