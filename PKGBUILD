# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=passring
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple password manager providing a freedesktop secret service API "
arch=('any')
url="https://git.sr.ht/~rumpelsepp/passring"
license=('GPL3')
makedepends=('go')
# depends=()
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/passring/archive/v${pkgver}.tar.gz")
sha256sums=('b9bbffcc6e029a8168fc03fdc225e7d5da32f03d20e252d5612756bdf8dd2b5b')

build() {
  cd $srcdir/$pkgname-v$pkgver
  make

  ./passring completion fish > passring.fish
}

package() {
  cd $srcdir/$pkgname-v$pkgver
  install -D -m 755 passring $pkgdir/usr/bin/passring
  install -D -m 644 passring.fish "${pkgdir}/usr/share/fish/vendor_completions.d/passring.fish"
}
