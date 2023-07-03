# Contributor: Patrick Wozniak <email@patwoz.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-cli
pkgver=2.7
_relver=1
_hash=gd5959582
pkgrel=1
pkgdesc='CLI version of Master Password'
arch=('i686' 'x86_64')
url='https://spectre.app/'
license=('GPL3')
depends=('ncurses' 'json-c' 'libsodium')
makedepends=('openssl')
checkdepends=('jq')
optdepends=('xclip: copy password to clipboard')
source=("https://gitlab.com/MasterPassword/MasterPassword/-/raw/1e7491e0d9f39ac6d49e4078cf445ca69e71020a/mpw-${pkgver}-cli-${_relver}-0-${_hash}.tar.gz"{,.sig})
sha256sums=('480206dfaad5d5a7d71fba235f1f3d9041e70b02a8c1d3dda8ecba1da39d3e96'
            'SKIP')
validpgpkeys=('5C2D1D61853F20F2FCDDCCB70EF21226F43EA6BC') # Maarten Billemont

build() {
  export LDFLAGS="$LDFLAGS -ltinfo"
  cd cli
  ./build
}

check() {
  cd cli
  ./mpw-cli-tests
}

package() {
  cd cli
  /usr/bin/install -Dm755 mpw "$pkgdir/usr/bin/mpw"
}
