# Maintainer: Kai Michaelis <kai@sequoia-pgp.org>
pkgname=sequoia-git
pkgver=r1176.bc95696
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
source=($pkgname::git+https://gitlab.com/sequoia-pgp/sequoia.git)
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
