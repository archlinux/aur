# Maintainer: Thomas Nixon <tom@tomn.co.uk>
pkgname=shet-c-client-git
pkgver=r5.6d9523a
pkgrel=1
pkgdesc="Command line clients for SHET, written in C."
arch=("i686" "x86_64")
url="https://github.com/18sg/SHETCClient"
license=('MIT')
depends=('shet-c-git')
makedepends=('git' 'scons')
source=('git+https://github.com/18sg/SHETCClient.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/SHETCClient"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/SHETCClient"
  scons installdir=/usr
}

package() {
  cd "$srcdir/SHETCClient"
  scons installdir="$pkgdir/usr" install

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
