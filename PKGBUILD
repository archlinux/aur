# Maintainer: Whyme Lyu <callme5long@gmail.com>

pkgname=debcraft
pkgver=0.8.1
pkgrel=1
pkgdesc="Easy, fast and secure way to build Debian packages"
arch=('any')
url='https://salsa.debian.org/debian/debcraft/'
license=('GPL-3.0-or-later')

depends=('bash' 'docker')  # For podman users: install podman-docker
makedepends=('help2man')

source=("$pkgname-$pkgver.tar.bz2"::https://salsa.debian.org/debian/debcraft/-/archive/debian/0.8.1/debcraft-debian-0.8.1.tar.bz2?ref_type=tags)
b2sums=('22350986e75bbffe47c957975f17411a8941e39a7e5ff66907f80172c3c2355c6e20527e667fda0cb69a9c4d9ca7bc47c2226ee2ce27db4255c694db4dd8b399')

# About check():
# Upstream runs shellcheck and codespell. Neither of which 
# validates that the code works on your machine like unit test do.
# I don't think it's worth it to run them here.

package() {
  cd "$srcdir/$pkgname-debian-$pkgver"
  # `make manpage` combines building & installing manpage in 
  # a single step which is kinda surprising.
  make DESTDIR="$pkgdir" manpage install
}
