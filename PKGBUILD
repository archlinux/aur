# Contributor: Patrick Wozniak <email@patwoz.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-cli
pkgver=2.6
_relver=4
_hash=gf8043ae1
pkgrel=2
pkgdesc='CLI version of Master Password'
arch=('i686' 'x86_64')
url='https://ssl.masterpasswordapp.com/'
license=('GPL3')
depends=('ncurses' 'json-c' 'libsodium')
makedepends=('openssl' 'cmake')
optdepends=('xclip: copy password to clipboard')
source=("https://ssl.masterpasswordapp.com/mpw-${pkgver}-cli-${_relver}-0-${_hash}.tar.gz"{,.sig})
sha256sums=('90480c0994cccdaa6637cc311e2092e5b6f2fdc751b58d218a6bd61e4603b2a0'
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
