# Maintainer: Whyme Lyu <callme5long@gmail.com>

pkgname=debcraft
pkgver=0.9.0
pkgrel=1
pkgdesc="Easy, fast and secure way to build Debian packages"
arch=('any')
url='https://salsa.debian.org/debian/debcraft/'
license=('GPL-3.0-or-later')

depends=('bash' 'docker')  # For podman users: install podman-docker
makedepends=('help2man')

source=("$pkgname-$pkgver.tar.bz2::https://salsa.debian.org/debian/debcraft/-/archive/debian/$pkgver/debcraft-debian-$pkgver.tar.bz2?ref_type=tags")
b2sums=('396a88ae9e0e272ae55afe8ff479374e9b6a2d0380227a3015fbb0f55457a05ec64889c9c62f36184962c98154b48174e71814e7f9b0504b3fadf6d1674a9209')

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
