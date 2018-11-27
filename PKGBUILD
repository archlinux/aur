# Maintainer: Kai Michaelis <kai@sequoia-pgp.org>
pkgname=sequoia
pkgver=0.2.0
pkgrel=1
pkgdesc="A cool OpenPGP library"
arch=('x86_64' 'i686')
url="https://sequoia-pgp.org/"
license=('GPL3')
groups=()
depends=(
  'nettle>=3'
  'sqlite>=3'
  'capnproto'
  'openssl>=1.1')
makedepends=(
    'clang'
    'rust'
    'cargo'
    'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=($pkgname::git+https://gitlab.com/sequoia-pgp/sequoia.git#tag=v0.2.0)
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-VCS}"
  make PREFIX="/usr" all
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	cargo test --all
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

