# Contributor: Patrick Wozniak <email@patwoz.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-cli
pkgver=2.5
_hash=g3ed6b937
pkgrel=1
pkgdesc='CLI version of Master Password'
arch=('i686' 'x86_64')
url='https://ssl.masterpasswordapp.com/'
license=('GPL3')
depends=('openssl')
makedepends=('git' 'libxml2' 'ncurses')
optdepends=('xclip: copy password to clipboard')
options=('!buildflags')
source=("https://ssl.masterpasswordapp.com/mpw-${pkgver}-cli-2-0-${_hash}.tar.gz"{,.sig})
sha256sums=('834d9fce03b5ad03ab9f5a37495a598e644430de97977cff9787c2bff1ae9742'
            'SKIP')
validpgpkeys=('5C2D1D61853F20F2FCDDCCB70EF21226F43EA6BC') # Maarten Billemont

prepare() {
  sed -i 's/openssl sha -sha256/openssl sha256/' build
}

build() {
  targets="mpw mpw-bench mpw-tests" ./build
  ./mpw-bench
  ./mpw-tests
}

package() {
  /usr/bin/install -Dm755 mpw "$pkgdir/usr/bin/mpw"

  /usr/bin/install -Dm644 mpw.completion.bash "$pkgdir/usr/share/bash-completion/completions/mpw"
}
